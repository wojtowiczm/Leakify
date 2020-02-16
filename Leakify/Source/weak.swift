//
//  LeakifyConvertible.swift
//  Leakify
//
//  Created by Michał Wójtowicz on 18/09/2019.
//

public extension LeakifyConvertible {
    
    /// Makes weak reference on object when calling his method
    ///
    /// - Parameters:
    ///   - classFunction: `(T) -> (U) -> V`- reference to method will be executed
    /// - Returns: `(U) -> V` funcion with weak reference
    subscript <U, V>(weak classFunction: @escaping (Self) -> (U) -> V) -> (U) -> V? {
        return { [weak self] args in
            guard let self = self else { return nil }
            let instanceFunction = classFunction(self)
            return instanceFunction(args)
        }
    }
    
    /// Makes weak reference on object when calling his method
    ///
    /// - Parameters:
    ///   - classFunction: `(T) -> (U) -> Void`- reference to method will be executed
    /// - Returns: `(U) -> Void` funcion with weak reference
    subscript <U>(weak classFunction: @escaping (Self) -> (U) -> Void) -> (U) -> Void {
        return { [weak self] args in
            guard let self = self else { return }
            let instanceFunction = classFunction(self)
            return instanceFunction(args)
        }
    }
    
    /// Makes weak reference on object when calling his method
    ///
    /// - Parameters:
    ///   - classFunction: `(T) -> () -> Void`- reference to method will be executed
    /// - Returns: `() -> Void` funcion with weak reference
    subscript (weak classFunction: @escaping (Self) -> () -> Void) -> () -> Void {
        return { [weak self] in
            guard let self = self else { return }
            let instanceFunction = classFunction(self)
            return instanceFunction()
        }
    }
}
