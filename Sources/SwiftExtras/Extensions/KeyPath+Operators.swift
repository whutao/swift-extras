/// Creates a predicate that inverts the Boolean property at the given key path.
@inlinable
public prefix func ! <Root>(keyPath: KeyPath<Root, Bool>) -> (Root) -> Bool {
    return { !$0[keyPath: keyPath] }
}

/// Creates a predicate that tests whether the property at the key path equals the given value.
@inlinable
public func == <Root, Property: Equatable>(lhs: KeyPath<Root, Property>, rhs: Property) -> (Root) -> Bool {
    return { $0[keyPath: lhs] == rhs }
}

/// Creates a predicate that tests whether the reference-type property at the key path is identical to the given instance.
@inlinable
public func === <Root, Property: AnyObject>(lhs: KeyPath<Root, Property>, rhs: Property) -> (Root) -> Bool {
    return { $0[keyPath: lhs] === rhs }
}

/// Creates a predicate that tests whether the property at the key path does not equal the given value.
@inlinable
public func != <Root, Property: Equatable>(lhs: KeyPath<Root, Property>, rhs: Property) -> (Root) -> Bool {
    return { $0[keyPath: lhs] != rhs }
}

/// Creates a predicate that tests whether the reference-type property at the key path is not identical to the given instance.
@inlinable
public func !== <Root, Property: AnyObject>(lhs: KeyPath<Root, Property>, rhs: Property) -> (Root) -> Bool {
    return { $0[keyPath: lhs] !== rhs }
}

/// Creates a predicate that tests whether the comparable property at the key path is less than the given value.
@inlinable
public func < <Root, Property: Comparable>(lhs: KeyPath<Root, Property>, rhs: Property) -> (Root) -> Bool {
    return { $0[keyPath: lhs] < rhs }
}

/// Creates a predicate that tests whether the comparable property at the key path is less than or equal to the given value.
@inlinable
public func <= <Root, Property: Comparable>(lhs: KeyPath<Root, Property>, rhs: Property) -> (Root) -> Bool {
    return { $0[keyPath: lhs] <= rhs }
}

/// Creates a predicate that tests whether the comparable property at the key path is greater than the given value.
@inlinable
public func > <Root, Property: Comparable>(lhs: KeyPath<Root, Property>, rhs: Property) -> (Root) -> Bool {
    return { $0[keyPath: lhs] > rhs }
}

/// Creates a predicate that tests whether the comparable property at the key path is greater than or equal to the given value.
@inlinable
public func >= <Root, Property: Comparable>(lhs: KeyPath<Root, Property>, rhs: Property) -> (Root) -> Bool {
    return { $0[keyPath: lhs] >= rhs }
}
