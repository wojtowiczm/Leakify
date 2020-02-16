//
//  LeakifyConvertible.swift
//  Leakify
//
//  Created by Michał Wójtowicz on 18/09/2019.
//

extension LeakifyConvertible {
    /// Makes unowned reference on object when calling his method
    ///
    /// - Parameters:
    ///   - classFunction: `(T) -> (U) -> V`- reference to method will be executed
    /// - Returns: `(U) -> V` funcion with unown reference
    subscript <U, V>(unowned classFunction: @escaping (Self) -> (U) -> V) -> (U) -> V {
        return { [unowned self] args in
            let instanceFunction = classFunction(self)
            return instanceFunction(args)
        }
    }
    
    /// Makes unowned reference on object when calling his method
    ///
    /// - Parameters:
    ///   - classFunction: `(T) -> (U) -> Void`- reference to method will be executed
    /// - Returns: `(U) -> Void` funcion with unowned reference
    subscript <U>(unowned classFunction: @escaping (Self) -> (U) -> Void) -> (U) -> Void {
        return { [unowned self] args in
            let instanceFunction = classFunction(self)
            return instanceFunction(args)
        }
    }
    
    /// Makes unowned reference on object when calling his method
    ///
    /// - Parameters:
    ///   - classFunction: `(T) -> () -> Void`- reference to method will be executed
    /// - Returns: `() -> Void` funcion with unowned reference
    subscript (unowned classFunction: @escaping (Self) -> () -> Void) -> () -> Void {
        return { [unowned self] in
            let instanceFunction = classFunction(self)
            return instanceFunction()
        }
    }
}
