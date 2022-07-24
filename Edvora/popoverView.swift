//
//  popoverView.swift
//  Edvora
//
//  Created by Margi  Bhatt on 21/07/22.
//

import SwiftUI
import Combine

struct popoverView: View {
    @State var rides: [Ride] = []
    var ridesValue: Int = 0
    var ride: Ride
    var body: some View {
        VStack(alignment: .center, spacing: 30, content: {
            Rectangle().frame(width: 150, height: 2, alignment: .center)
            Image("Map").resizable().frame(width: 320, height: 200, alignment: .top).cornerRadius(20).shadow(color: .gray, radius: 20, x: 20, y: 20).opacity(1)
            detailsView(ride: ride).clipShape(Rectangle()).cornerRadius(20).shadow(color: .gray, radius: 20, x: 20, y: 20).opacity(1)
        })
        .frame(width: 400, height: 620, alignment: .center)
        
    }
}

struct popoverView_Previews: PreviewProvider {
    static let ridepreview = Ride(id: 1, originStationCode: 1, stationPath: [1,2], destinationStationCode: 1, date: "1", mapURL: URL(string: BASEURL)!, state: "1", city: "1")
    
    static var previews: some View {
        popoverView(ride: ridepreview).cornerRadius(20).shadow(color: .gray, radius: 20, x: 20, y: 20)
    }
}
