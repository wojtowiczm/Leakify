import XCTest
import Leakify
import SpecLeaks
import Quick
import Nimble

import Foundation

class BaseMock {
    
    var state: Bool = false
    
    let service: LeakingService = .init()
    
    func objectMethodWithArg(_ arg: Bool) {
        state = arg
    }
    
    func objectMethodWithoutArg(_ arg: Bool) {
        state.toggle()
    }
}


class LeakingService {
    
    var state: Bool = true
    
    func methodWithArg(then completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { completion(!self.state)}
    }
    
    func methodWithoutArg(then completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { completion(!self.state)}
    }
}
