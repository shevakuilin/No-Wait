//
//  NWLoadDataStore.swift
//  No Wait
//
//  Created by ShevaKuilin on 2018/1/5.
//  Copyright © 2018年 ShevaKuilin. All rights reserved.
//

import Foundation

let dummy = [
    "融科橄榄城",
    "望京东地铁站",
    "望京Soho",
    "阜通西路",
    "花溪地西里二区",
    "三元桥",
    "望京西地铁站",
    "融科橄榄城",
    "望京东地铁站",
    "望京Soho",
    "阜通西路",
    "花溪地西里二区",
    "三元桥",
    "望京西地铁站",
    "融科橄榄城",
    "望京东地铁站",
    "望京Soho",
    "阜通西路",
    "花溪地西里二区",
    "三元桥",
    "望京西地铁站"
]

struct NWLoadDataStore {
    static let shared = NWLoadDataStore()
    func getCurrentBusStops(completionHandler: (([String]) -> Void)?) {
        completionHandler?(dummy)
    }
}
