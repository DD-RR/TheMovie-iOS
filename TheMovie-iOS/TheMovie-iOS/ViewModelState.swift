//
//  ViewModelState.swift
//  TheMovie-iOS
//
//  Created by Diego David Rodríguez Reyna on 21/02/23.
//

import Foundation

@propertyWrapper
class ViewModelState<State> {
    var projectedValue: ViewModelState<State> { self }
    
    var wrappedValue: State {
        didSet {
            observer?(wrappedValue)
        }
    }
    
    var observer: ((State) -> Void)? {
        didSet {
            observer?(wrappedValue)
        }
    }
    
    init(wrappedValue: State) {
        self.wrappedValue = wrappedValue
    }
}
