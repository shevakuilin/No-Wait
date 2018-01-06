//
//  NWRequestParamater.swift
//  No Wait
//
//  Created by ShevaKuilin on 2018/1/6.
//  Copyright © 2018年 ShevaKuilin. All rights reserved.
//

import CryptoSwift

struct RequestParamater {
    static let deviceId = "device_id"
    static let keywords = "keywords"
    static let sign = "sign"
    static let timestamp = "timestamp"
}

struct RequestURL {
    static let host = "http://apprealtimebus.bjbus.com/app/app"
    static let path_queryRouteByKeyword = "getRouteAndstationInfosByKeywords"
    static let path_queryStationByRouteId = "getStationInfosByRouteid"
    static let path_queryNoticeInfo = "getNoticeInfo"
    static let path_queryLocalWeather = "getLocalWeather"
}
