//
//  NWBeijingBusAPI.swift
//  No Wait
//
//  Created by ShevaKuilin on 2018/1/6.
//  Copyright © 2018年 ShevaKuilin. All rights reserved.
//

import Moya
import Foundation
import MFSIdentifier

let BeijingBusProvider = MoyaProvider<BeijingBus>()

enum BeijingBus {
    case routeAndStationInfo(routeCode: String)
    case stationInfo
    case NoticeInfo
    case LocalWeather
}

extension BeijingBus: TargetType {
    var baseURL: URL {
        return URL(string: RequestURL.host)!
    }
    
    var path: String {
        switch self {
        case .routeAndStationInfo: return RequestURL.path_queryRouteByKeyword
        case .stationInfo: return RequestURL.path_queryStationByRouteId
        case .NoticeInfo: return RequestURL.path_queryNoticeInfo
        case .LocalWeather: return RequestURL.path_queryLocalWeather
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        // NOTE: Unit Testing
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let currentDate = dateFormatter.string(from: nowDate)
        
        switch self {
        case .routeAndStationInfo(let routeCode):
            var paramters: [String: Any] = [:]
            paramters[RequestParamater.deviceId] = MFSIdentifier.deviceID()
            paramters[RequestParamater.keywords] = routeCode
            paramters[RequestParamater.sign] = routeCode.md5()
            paramters[RequestParamater.timestamp] = currentDate
            
            return .requestParameters(parameters: paramters, encoding: URLEncoding.default)
        case .stationInfo:
            var paramters: [String: Any] = [:]
            paramters[RequestParamater.deviceId] = MFSIdentifier.deviceID()
            
            return .requestParameters(parameters: paramters, encoding: URLEncoding.default)
        case .NoticeInfo:
            var paramters: [String: Any] = [:]
            paramters[RequestParamater.deviceId] = MFSIdentifier.deviceID()
            
            return .requestParameters(parameters: paramters, encoding: URLEncoding.default)
        case .LocalWeather:
            var paramters: [String: Any] = [:]
            paramters[RequestParamater.deviceId] = MFSIdentifier.deviceID()
            
            return .requestParameters(parameters: paramters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
