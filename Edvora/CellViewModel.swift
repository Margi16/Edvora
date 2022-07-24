//
//  CellViewModel.swift
//  Edvora
//
//  Created by Margi  Bhatt on 21/07/22.
//

import Foundation
import Combine

public class RideFetcher: ObservableObject{
    @Published var rides = [Ride]()
    
    init(){
        load()
    }
    func load(){
        let url = URL(string: BASEURL)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([Ride].self, from: d)
                    DispatchQueue.main.async {
                        self.rides = decodedLists
                    }
                }
                else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}
