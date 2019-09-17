//
//  LeakifyConvertible.swift
//  Leakify
//
//  Created by Michał Wójtowicz on 18/09/2019.
//

/// Higher-order function making weak reference on object when calling his method
///
/// - Parameters:
///   - instance: `T` - Object of whitch reference will unowned
///   - classFunction: `(T) -> (U) -> V`- Class reference to method whitch will be executed
/// - Returns: `(U) -> V` funcion with weak reference
public func weak<T: AnyObject, U, V>(_ instance: T, _ classFunction: @escaping (T) -> (U) -> V) -> (U) -> V? {
    return { [weak instance] args in
        guard let instance = instance else { return nil }
        let instanceFunction = classFunction(instance)
        return instanceFunction(args)
    }
}

/// Higher-order function making weak reference on object when calling his method
///
/// - Parameters:
///   - instance: `T` - Object of whitch reference will unowned
///   - classFunction: `(T) -> () -> Void`- Class reference to method whitch will be executed
/// - Returns: `() -> Void` funcion with weak reference
public func weak<T: AnyObject>(_ instance: T, _ classFunction: @escaping (T) -> () -> Void) -> () -> Void? {
    return { [weak instance] in
        guard let instance = instance else { return nil }
        let instanceFunction = classFunction(instance)
        return instanceFunction()
    }
}
