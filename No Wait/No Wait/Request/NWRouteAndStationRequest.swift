//
//  NWRouteAndStationRequest.swift
//  No Wait
//
//  Created by ShevaKuilin on 2018/1/7.
//  Copyright © 2018年 ShevaKuilin. All rights reserved.
//

import Foundation

struct RouteAndStationRequest: Request {
    let routeCode: String
    
    var externalParamater: String {
        return routeCode
    }
    
    typealias Response = NWRouteAndStationInfo
}
