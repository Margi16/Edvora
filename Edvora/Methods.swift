//
//  Methods.swift
//  Edvora
//
//  Created by Margi  Bhatt on 23/07/22.
//

import Foundation

func getNearestArray(array: [Ride])->[Ride] {
    var nsortedarray: [Int] = []
    var rsortedarray: [Ride] = []
    var dict: [Int:Ride] = [:]
    
    array.filter { ride in
        nsortedarray.append(ride.distanceCalculate())
        dict.updateValue(ride, forKey: ride.distanceCalculate())
        return true
    }
    let dictSorted: [Int] = dict.keys.sorted()
    
    for i in dictSorted {
        rsortedarray.append(dict[i]!)
    }
    return rsortedarray
}

func getUpcomingArray(array: [Ride])->[Ride] {
    var rsortedarray: [Ride] = []
    let dateFormatter = DateFormatter()
    
    
    for i in array {
        dateFormatter.dateFormat = "dd/mm/yyyy HH:mm a"
        let newDate = dateFormatter.date(from: i.date)!
        let todaysDate = Date.now
        if newDate>todaysDate{
            rsortedarray.append(i)
        }
    }
    return rsortedarray
}

func getPastArray(array: [Ride])->[Ride] {
    var rsortedarray: [Ride] = []
    let dateFormatter = DateFormatter()
    
    
    for i in array {
        dateFormatter.dateFormat = "dd/mm/yyyy HH:mm a"
        let newDate = dateFormatter.date(from: i.date)!
        let todaysDate = Date.now
        if newDate<todaysDate{
            rsortedarray.append(i)
        }
    }
    return rsortedarray
}

func getState(array: [Ride])->[String:[Ride]] {
    var dict: [String:[Ride]] = [:]
    for i in array {
        if(dict[i.state]?.isEmpty==false) {
            dict[i.state]?.append(i)
        }
        else{
            dict.updateValue([i], forKey: i.state)
        }
        
    }
    
    print("dict is \(dict)")
    print(dict.keys)
    
    
    return dict
}

func getStatee(array: [Ride])->[String] {
    var statenamearray: [String] = []
    for ride in array {
        if(!statenamearray.contains(ride.state)){
            statenamearray.append(ride.state)
        }
    }
    
    print("state name array : \(statenamearray)")
    return statenamearray
}

func getCity(array: [Ride])->[String:[Ride]] {
    var dict: [String:[Ride]] = [:]
    for i in array {
        if(dict[i.city]?.isEmpty==false) {
            dict[i.city]?.append(i)
        }
        else{
            dict.updateValue([i], forKey: i.city)
        }

    }

    print("dict is \(dict)")
    print(dict.keys)


    return dict
}


func getStateCity(response: [Ride])->[String: [String]] {
    let keysSet = Set(response.map{$0.state})
    var stateCityDict : [String: [String]] = Dictionary(uniqueKeysWithValues: zip(keysSet, []))
    for obj in response {
        if stateCityDict.keys.contains(obj.state) {
            if !stateCityDict[obj.state]!.contains(obj.city) {
                var arrray = stateCityDict[obj.state]!
                arrray.append(obj.city)
                stateCityDict[obj.state] = arrray
            }
        } else {
            stateCityDict[obj.state] = [obj.city]
        }
    }
    return stateCityDict
}

