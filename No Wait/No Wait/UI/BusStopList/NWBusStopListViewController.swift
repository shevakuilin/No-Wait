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
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    init() {
        super.init(node: busStopList)
        self.title = "Bus Stop List"
        
        let dataSource = NWTableDataSource(datas: [], owner: self)
        
        reloadUIStore = NWReloadUIStore<Action, State, Command>(reducer:  reducer, initialState: State(dataSource: dataSource))
        reloadUIStore.subscribe { [weak self] state, previousState, command in
            self?.stateDidChanged(state: state, previousState: previousState, command: command)
        }
        stateDidChanged(state: reloadUIStore.state, previousState: nil, command: nil)
        reloadUIStore.dispatch(.loadBusData)
        
        RouteAndStationURLSessionClient.shared.send(RouteAndStationRequest(routeCode: "980")) {
            if let data = $0 {
                printLog("\(data)")
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    struct State: StateType {
        var dataSource = NWTableDataSource(datas: [], owner: nil)
    }
    
    enum Action: ActionType {
        case reloadBusPosition(position: [String])
        case loadBusData
    }
    
    enum Command: CommandType {
        case loadBusData(completion: ([String]) -> Void )
    }
    
    lazy var reducer: (State, Action) -> (state: State, command: Command?) = {
        [weak self] (state: State, action: Action) in
        
        var state = state
        var command: Command? = nil
        
        switch action {
        case .reloadBusPosition(let position):
            state.dataSource = NWTableDataSource(datas: position, owner: state.dataSource.owner)
        case .loadBusData:
            command = Command.loadBusData { self?.reloadUIStore.dispatch(.reloadBusPosition(position: $0))}
        }
        return (state, command)
    }
    
    var reloadUIStore: NWReloadUIStore<Action, State, Command>!
    
    private func stateDidChanged(state: State, previousState: State?, command: Command?) {
        if let command = command {
            switch command {
            case .loadBusData(let handler):
                NWLoadDataStore.shared.getCurrentBusStops(completionHandler: handler)
            }
        }
        
        if previousState == nil || previousState!.dataSource.datas != state.dataSource.datas {
            let dataSource = state.dataSource
            busStopList.dataSource = dataSource
            busStopList.reloadData()
        }
    }
}

extension NWBusStopListViewController: ASTableDelegate {
    
}
