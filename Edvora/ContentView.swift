//
//  ContentView.swift
//  Edvora
//
//  Created by Margi Bhatt on 21/07/22.
//

import SwiftUI
import Combine

struct MyButtonStyle: ButtonStyle {
    @State var toggleValue = false
    func makeBody(configuration: Self.Configuration) -> some View {
        if self.toggleValue == true {
            configuration.label
                .padding()
                .buttonStyle(.bordered)
                .cornerRadius(8.0)
        }
        else {
            configuration.label
                .padding()
                .buttonStyle(.borderless)
                .cornerRadius(8.0)
        }
    }
    
}

struct dict {
    let keyval: String
    let valval: [Ride]
}

struct ContentView: View {
    @ObservedObject var fetcher = RideFetcher()
    @State var rides: [Ride] = []
    var ridesValue: Int = 0
    var cellCount: Int = 0
    var filterIndex: Int = 0
    var nearestList: [Ride] = []
    var upcomingList: [Ride] = []
    var pastList: [Ride] = []
    @State var filteredArray: [Ride] = []
    @State var selectedTab = Tabs.FirstTab
    
    var body: some View {
        VStack{
            
            NavigationView {
                VStack{
                    HStack(alignment: .center, spacing: 10, content: {
                        
                        Spacer()
                        VStack {
                            Text("Nearest").foregroundColor(selectedTab == .FirstTab ? Color.blue : Color.black)
                        }
                        .onTapGesture {
                            self.selectedTab = .FirstTab
                            filteredArray = getNearestArray(array: fetcher.rides)
                        }
                        Spacer()
                        VStack {
                            Text("Upcoming").foregroundColor(selectedTab == .SecondTab ? Color.blue : Color.black)
                        }
                        .onTapGesture {
                            self.selectedTab = .SecondTab
                            filteredArray = getUpcomingArray(array: fetcher.rides)
                        }
                        Spacer()
                        VStack {
                            Text("Past").foregroundColor(selectedTab == .ThirdTab ? Color.blue : Color.black)
                        }
                        .onTapGesture {
                            self.selectedTab = .ThirdTab
                            filteredArray = getPastArray(array: fetcher.rides)
                        }
                        Spacer()
                        Menu {
                            Menu {
                                let dictState = getState(array: fetcher.rides).keys.sorted()
                                ForEach(0..<dictState.count){ index in
                                    Button {
                                        if(fetcher.rides[index].state==dictState[index]){
                                            self.selectedTab = .FourthTab
                                            filteredArray = getState(array: fetcher.rides)[dictState[index]]!
                                            debugPrint("filteredArray is \(filteredArray)")
                                        }
                                    } label: {
                                        Text(dictState[index])
                                    }
                                }
                                
                                
                            } label: {
                                Label {
                                    Text("State")
                                } icon: {
                                    //
                                }
                                
                            }
                            
                            Menu {
                                let dictCity = getCity(array: fetcher.rides).keys.sorted()
                                ForEach(0..<dictCity.count){ index in
                                    Button {
                                        if(fetcher.rides[index].state==dictCity[index]){
                                            self.selectedTab = .FourthTab
                                            filteredArray = getCity(array: fetcher.rides)[dictCity[index]]!
                                            debugPrint("filteredArray is \(filteredArray)")
                                        }
                                    } label: {
                                        Text(dictCity[index])
                                    }
                                }
                            } label: {
                                Label {
                                    Text("City")
                                } icon: {
                                    //
                                }
                                
                            }
                            
                            
                        } label: {
                            Label {
                                Text("Filters").foregroundColor(selectedTab == .FourthTab ? Color.blue : Color.black)
                            } icon: {
                                Image(systemName: "line.3.horizontal.decrease.circle.fill").foregroundColor(selectedTab == .FourthTab ? Color.blue : Color.black)
                            }
                            
                        }
                        Spacer()
                        
                    })
                    .padding(.bottom)
                    
                    Spacer()
                    
                    if selectedTab == .FirstTab {
                        FirstTabView()
                    } else if selectedTab == .SecondTab {
                        SecondTabView()
                    } else if selectedTab == .ThirdTab{
                        ThirdTabView()
                    } else if selectedTab == .FourthTab{
                        FourthTabView()
                    }
                    
                    
                }
                .navigationTitle("Edvora")
                .navigationBarTitleDisplayMode(.large)
                
            }
            
            
        }
    }
    
}

struct FirstTabView : View {
    @ObservedObject var fetcher = RideFetcher()
    @State var rides: [Ride] = []
    var ridesValue: Int = 0
    var cellCount: Int = 0
    var body : some View {
        ScrollView{
            VStack{
                ForEach(getNearestArray(array: fetcher.rides)) {ride in
                    Section{
                        CellView(fetcher: fetcher, ride: ride, cellCount: cellCount, rides: rides, ridesValue: ridesValue)
                    }
                    .frame(width: 330, height: 230, alignment: .leading)
                    
                }
            }
        }
    }
}

struct SecondTabView : View {
    @ObservedObject var fetcher = RideFetcher()
    @State var rides: [Ride] = []
    var ridesValue: Int = 0
    var cellCount: Int = 0
    var body : some View {
        ScrollView{
            VStack{
                ForEach(getUpcomingArray(array: fetcher.rides)) {ride in
                    Section{
                        CellView(fetcher: fetcher, ride: ride, cellCount: cellCount, rides: rides, ridesValue: ridesValue)
                    }
                    .frame(width: 330, height: 230, alignment: .leading)
                    
                }
            }
            //                        .background(Color.red)
        }
        //                    .background(Color.red)
    }
}

struct ThirdTabView : View {
    @ObservedObject var fetcher = RideFetcher()
    @State var rides: [Ride] = []
    var ridesValue: Int = 0
    var cellCount: Int = 0
    var body : some View {
        ScrollView{
            VStack{
                ForEach(getPastArray(array: fetcher.rides)) {ride in
                    Section{
                        CellView(fetcher: fetcher, ride: ride, cellCount: cellCount, rides: rides, ridesValue: ridesValue)
                    }
                    .frame(width: 330, height: 230, alignment: .leading)
                    
                }
            }
        }
    }
}

struct FourthTabView : View {
    @ObservedObject var fetcher = RideFetcher()
    @State var rides: [Ride] = []
    var ridesValue: Int = 0
    var cellCount: Int = 0
    @State var filteredArray: [Ride] = []
    var body : some View {
        ScrollView{
            
        }
    }
}

enum Tabs {
    case FirstTab
    case SecondTab
    case ThirdTab
    case FourthTab
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().background(Color.white.opacity(0.3))
    }
}
