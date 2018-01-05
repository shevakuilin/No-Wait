//
//  NWBusStopCellNode.swift
//  No Wait
//
//  Created by ShevaKuilin on 2018/1/5.
//  Copyright © 2018年 ShevaKuilin. All rights reserved.
//

import AsyncDisplayKit

class NWBusStopCellNode: ASCellNode {
    
    private let busStopNameNode = ASTextNode()
    
    init(busStopName: String) {
        super.init()
        self.automaticallyManagesSubnodes = true
        
        busStopNameNode.attributedText = NSAttributedString(string: busStopName, attributes: nil)
        self.addSubnode(busStopNameNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let horizontalStackSpec = ASStackLayoutSpec.horizontal()
        horizontalStackSpec.justifyContent = .end
        horizontalStackSpec.children = [busStopNameNode]
        
        return ASInsetLayoutSpec(insets: UIEdgeInsetsMake(10, 10, 10, 50), child: horizontalStackSpec)
    }
}
