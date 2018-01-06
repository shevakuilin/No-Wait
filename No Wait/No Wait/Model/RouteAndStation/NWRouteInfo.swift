//
//  NWRouteInfo.swift
//  No Wait
//
//  Created by ShevaKuilin on 2018/1/6.
//  Copyright © 2018年 ShevaKuilin. All rights reserved.
//

import Foundation

struct NWRouteInfo {
    let route_id: String
    let route_name: String
    let start_station: String
    let end_station: String
    let direction: String
    
    init?(data: Data) {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            return nil
        }
        
        guard let route_id = json?["route_id"] as? String else {
            return nil
        }
        
        guard let route_name = json?["route_name"] as? String else {
            return nil
        }
        
        guard let start_station = json?["start_station"] as? String else {
            return nil
        }
        
        guard let end_station = json?["end_station"] as? String else {
            return nil
        }
        
        guard let direction = json?["direction"] as? String else {
            return nil
        }
        
        self.route_id = route_id
        self.route_name = route_name
        self.start_station = start_station
        self.end_station = end_station
        self.direction = direction
    }
}
