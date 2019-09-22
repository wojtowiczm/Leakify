//
//  LeakifyConvertible.swift
//  Leakify
//
//  Created by Michał Wójtowicz on 18/09/2019.
//

public protocol LeakifyConvertible: class {}

public extension LeakifyConvertible {
    /// Helper for getting class reference of object
    ///
    /// - Returns:
    ///   - Self.Type: reference of object type
    var lf: Self.Type {
        return type(of: self)
    }
}
