
func unown<T: AnyObject, U, V>(_ instance: T, _ classFunction: @escaping (T) -> (U) -> V) -> (U) -> V {
    return { [unowned instance] args in
        let instanceFunction = classFunction(instance)
        return instanceFunction(args)
    }
}

func unown<T: AnyObject>(_ instance: T, _ classFunction: @escaping (T) -> () -> Void) -> () -> Void {
    return { [unowned instance] in
        let instanceFunction = classFunction(instance)
        return instanceFunction()
    }
}

func weak<T: AnyObject, U, V>(_ instance: T, _ classFunction: @escaping (T) -> (U) -> V) -> (U) -> V? {
    return { [weak instance] args in
        guard let instance = instance else { return nil }
        let instanceFunction = classFunction(instance)
        return instanceFunction(args)
    }
}

/// Helper for getting class reference of object
///
/// - Parameters:
///   - object: `O` - Object of whitch reference will be returned
func T<O>(_ object: O) -> O.Type {
    return type(of: object)
}
