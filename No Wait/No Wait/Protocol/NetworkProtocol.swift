//
//  NetworkProtocol.swift
//  No Wait
//
//  Created by ShevaKuilin on 2018/1/6.
//  Copyright © 2018年 ShevaKuilin. All rights reserved.
//

import Foundation

protocol Request {
    var externalParamater: String { get }
    associatedtype Response: Decodable
}

protocol Client {
    func send<T: Request>(_ r: T, handler: @escaping (T.Response?) -> Void)
}

protocol Decodable {
    static func parse(data: Data) -> Self?
}

struct RouteAndStationURLSessionClient: Client {
    static let shared = RouteAndStationURLSessionClient()
    
    func send<T>(_ r: T, handler: @escaping (T.Response?) -> Void) where T : Request {
        BeijingBusProvider.request(BeijingBus.routeAndStationInfo(routeCode: r.externalParamater)) {
            switch $0 {
            case let .success(moyaResponse):
                let res = T.Response.parse(data: moyaResponse.data)
                DispatchQueue.main.async {
                    handler(res)
                }
                printLog("query routeAndStationInfo success!")
            case let .failure(error):
                printLog("query routeAndStationInfo failure, reason: \(error)")
            }
            
        }
    }
}
