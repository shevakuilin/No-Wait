//
//  NWTableDataSource.swift
//  No Wait
//
//  Created by ShevaKuilin on 2018/1/5.
//  Copyright © 2018年 ShevaKuilin. All rights reserved.
//

import AsyncDisplayKit

class NWTableDataSource: NSObject, ASTableDataSource {
    
    enum NumberOfRow: Int {
        case noData = 0, busStopList, max
    }
    
    var datas: [String]
    weak var owner: UIViewController?
    var numberOfRow: NumberOfRow
    
    init(datas: [String], owner: UIViewController?) {
        self.datas = datas
        numberOfRow = datas.count == 0 ? .noData : .busStopList
        self.owner = owner
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        switch numberOfRow {
        case .noData: return 1
        case .busStopList: return datas.count
        case .max: fatalError()
        }
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        switch numberOfRow {
        case .noData:
            fatalError()
        case .busStopList:
            let busStop = self.datas[indexPath.row]
            return NWBusStopCellNode(busStopName: busStop)
        default:
            fatalError()
        }
    }
}
