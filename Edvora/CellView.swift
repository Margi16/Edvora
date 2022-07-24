//
//  CellView.swift
//  Edvora
//
//  Created by Margi  Bhatt on 21/07/22.
//

import SwiftUI
import Combine

struct CellView: View {
    @State private var textInput: String = ""
    @State private var showingPopover = false
    @ObservedObject var fetcher = RideFetcher()
    var ride: Ride
    var cellCount: Int = 0
    @State var rides: [Ride] = []
    var ridesValue: Int = 0
    var body: some View {
        Button {
            showingPopover=true
            print("preview")
        } label: {
            VStack {
                ZStack{
                    Image("Map").resizable().overlay(alignment: .bottomTrailing) {
                        Rectangle().frame(width: 60, height: 20, alignment: .bottomTrailing).cornerRadius(5).padding()
                        Text("\(ride.distanceCalculate()) km")
                            .multilineTextAlignment(.center)
                            .font(.body.weight(.medium))
                            .foregroundColor(.white)
                        
                    }
                    
                }
                
                HStack {
                    HStack {
                        Text("#")
                            .foregroundColor(.blue)
                        Label("\(ride.id)", image: "")
                    }.multilineTextAlignment(.leading).foregroundColor(.black)
                        .padding()
                    Spacer()
                    HStack {
                        Label("\(ride.convertDate())", systemImage: "calendar").foregroundColor(.blue)
                            .padding()
                    }.multilineTextAlignment(.trailing)
                }
                .frame(width: 310, height: 40, alignment: .center)
            }
            .frame(width: 330, height: 200, alignment: .center)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(20)
            
        }.popover(isPresented: $showingPopover) {
            popoverView(ride: ride)
        }
        
    }
    
}

struct CellView_Previews: PreviewProvider {
    static let ridepreview = Ride(id: 1, originStationCode: 1, stationPath: [1,2], destinationStationCode: 1, date: "1", mapURL: URL(string: BASEURL)!, state: "1", city: "1")
    
    static var previews: some View {
        CellView( ride: ridepreview)
            .cornerRadius(20).shadow(color: .gray, radius: 20, x: 20, y: 20)
    }
}
