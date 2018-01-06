//
//  NWRouteAndStationInfo.swift
//  No Wait
//
//  Created by ShevaKuilin on 2018/1/6.
//  Copyright © 2018年 ShevaKuilin. All rights reserved.
//

import Foundation

struct NWRouteAndStationInfo {
    let status_code: String
    let status_desc: String
    let warning_code: String
    let warning_desc: String
    let data: [String: Any]
    let datas: [String: Any]
    let route_infos: [NWRouteInfo]
    let station_infos: [NWStationInfo]
    
    init?(data: Data) {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            return nil
        }
        
        guard let status_code = json?["status_code"] as? String else {
            return nil
        }
        
        guard let status_desc = json?["status_desc"] as? String else {
            return nil
        }
        
        guard let warning_code = json?["warning_code"] as? String else {
            return nil
        }
        
        guard let warning_desc = json?["warning_desc"] as? String else {
            return nil
        }
        
        guard let data = json?["data"] as? [String: Any] else {
            return nil
        }
        
        guard let datas = json?["datas"] as? [String: Any] else {
            return nil
        }
        
        guard let route_infos = json?["route_infos"] as? [NWRouteInfo] else {
            return nil
        }
        
        guard let station_infos = json?["station_infos"] as? [NWStationInfo] else {
            return nil
        }
        
        self.status_code = status_code
        self.status_desc = status_desc
        self.warning_code = warning_code
        self.warning_desc = warning_desc
        self.data = data
        self.datas = datas
        self.route_infos = route_infos
        self.station_infos = station_infos
    }
}

extension NWRouteAndStationInfo: Decodable {
    static func parse(data: Data) -> NWRouteAndStationInfo? {
        return NWRouteAndStationInfo(data: data)
    }
}
