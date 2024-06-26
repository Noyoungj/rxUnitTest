//
//  Reactor.swift
//  Test
//
//  Created by 노영재(Youngjae No)_인턴 on 3/25/24.
//

import Foundation
import ReactorKit

final class ViewReactor: Reactor {
    enum Action {
        case tapPlusButton
    }
    
    enum Mutation {
        case setPlusCnt(Int)
    }
    
    struct State {
        var cnt = 0
    }
    
    let initialState: State = State()
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .tapPlusButton:
            return .just(.setPlusCnt(1))
                .delay(.seconds(1), scheduler: MainScheduler.asyncInstance)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .setPlusCnt(int):
            state.cnt += int
        }
        return state
    }
}
