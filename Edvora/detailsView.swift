//
//  detailsView.swift
//  Edvora
//
//  Created by Margi  Bhatt on 21/07/22.
//

import SwiftUI
import Combine

struct detailsView: View {
    @State var rides: [Ride] = []
    var ridesValue: Int = 0
    var ride: Ride
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Label {
                        Text("Ride ID")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 12))
                    } icon: {
                        
                    }
                    Label {
                        Text("\(ride.id)")
                            .multilineTextAlignment(.leading)
                            .font(.body)
                    } icon: {
                        
                    }
                }.multilineTextAlignment(.leading)
                Spacer()
                VStack{
                    Label {
                        Text("Origin Station")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 12))
                    } icon: {
                        
                    }
                    Label {
                        Text("\(ride.originStationCode)")
                            .multilineTextAlignment(.leading)
                            .font(.body)
                    } icon: {
                        
                    }
                }.multilineTextAlignment(.leading)
            }.padding()
            Divider()
            HStack{
                VStack{
                    Label {
                        Text("Date")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 12))
                    } icon: {
                        
                    }
                    Label {
                        Text("\(ride.convertDate())")
                            .multilineTextAlignment(.leading)
                            .font(.body)
                    } icon: {
                        
                    }
                }.multilineTextAlignment(.leading)
                Spacer()
                VStack{
                    Label {
                        Text("Distance")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 12))
                    } icon: {
                        
                    }
                    Label {
                        Text("\(ride.distanceCalculate()) km")
                            .multilineTextAlignment(.leading)
                            .font(.body)
                    } icon: {
                        
                    }
                }.multilineTextAlignment(.leading)
            }.padding()
            Divider()
            HStack{
                VStack{
                    Label {
                        Text("State")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 12))
                    } icon: {
                        
                    }
                    Label {
                        Text("\(ride.state)")
                            .multilineTextAlignment(.leading)
                            .font(.body)
                    } icon: {
                        
                    }
                }.multilineTextAlignment(.leading)
                Spacer()
                VStack{
                    Label {
                        Text("City")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 12))
                    } icon: {
                        
                    }
                    Label {
                        Text("\(ride.city)")
                            .multilineTextAlignment(.leading)
                            .font(.body)
                    } icon: {
                        
                    }
                }.multilineTextAlignment(.leading)
            }.padding()
            Divider()
            HStack{
                VStack{
                    Label {
                        Text("Station Path")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 12))
                    } icon: {
                        
                    }
                    Label {
                        Text("\(ride.convert())")
                            .multilineTextAlignment(.leading)
                            .font(.body)
                    } icon: {
                        
                    }
                }.multilineTextAlignment(.leading)
            }.padding()
        }.frame(width: 320, height: 350, alignment: .center)
            .background(Color.white)
        
    }
    
}

struct detailsView_Previews: PreviewProvider {
    static let ridepreview = Ride(id: 1, originStationCode: 1, stationPath: [1,2], destinationStationCode: 1, date: "1", mapURL: URL(string: BASEURL)!, state: "1", city: "1")
    
    static var previews: some View {
        detailsView(ride: ridepreview).clipShape(Rectangle()).cornerRadius(20).shadow(color: .gray, radius: 20, x: 20, y: 20)
    }
}
