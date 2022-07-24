//
//  Ride.swift
//  Edvora
//
//  Created by Margi  Bhatt on 21/07/22.
//

import Foundation

struct Ride: Hashable, Codable, Identifiable {
    var id: Int
    var originStationCode: Int
    var stationPath: [Int]
    var destinationStationCode: Int
    var date: String
    var mapURL: URL
    var state: String
    var city: String
    func distanceCalculate()->Int {
        var dist = 0
        let copy = stationPath
        var arr: [Int] = []
        for i in copy {
            if i > originStationCode {
                arr.append(i - originStationCode)
            }
            else {
                arr.append(originStationCode - i)
            }
        }
        
        dist = arr.min()!
        return dist
    }
    
    func convert()->String{
        let spstring = stationPath.map{ String($0) }.joined(separator: ", ")
        return spstring
    }
    
    func convertDate()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/mm/yyyy HH:mm a"
        let ddate = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd MMM"
        let newDate: String = dateFormatter.string(from: ddate!)
        print(newDate)
        return newDate
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case originStationCode = "origin_station_code"
        case stationPath = "station_path"
        case destinationStationCode = "destination_station_code"
        case date = "date"
        case mapURL = "map_url"
        case state = "state"
        case city = "city"
    }
}
