//
//  NWBusStopListViewController.swift
//  No Wait
//
//  Created by ShevaKuilin on 2018/1/5.
//  Copyright © 2018年 ShevaKuilin. All rights reserved.
//

import AsyncDisplayKit

class NWBusStopListViewController: ASViewController<ASDisplayNode> {
    
    lazy var busStopList = ASTableNode().then {
        $0.delegate = self
        $0.dataSource = self
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    init() {
        super.init(node: busStopList)
        
        self.title = "Bus Stop List"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension NWBusStopListViewController: ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        let busStop = "the bus stop " + "\(indexPath.row)"
        return NWBusStopCellNode(busStopName: busStop)
    }
}

extension NWBusStopListViewController: ASTableDelegate {
    
}
