// MARK: Mix&Max

extension Sequence {
    
    /// Returns the element with the minimum value for the given key path.
    ///
    /// - Parameter keyPath: The key path to compare elements by.
    /// - Returns: The element with the smallest value for the specified key path, or `nil` if the sequence is empty.
    @inlinable
    public func min<Value: Comparable>(by keyPath: KeyPath<Element, Value>) -> Element? {
        return self.min { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
    }
    
    /// Returns the element with the maximum value for the given key path.
    ///
    /// - Parameter keyPath: The key path to compare elements by.
    /// - Returns: The element with the largest value for the specified key path, or `nil` if the sequence is empty.
    @inlinable
    public func max<Value: Comparable>(by keyPath: KeyPath<Element, Value>) -> Element? {
        return self.max { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
    }
}

// MARK: Sorting

extension Sequence {
    
    /// Returns the elements of the sequence, sorted in the increasing order using the given keypath.
    @inlinable
    public func sorted<Value: Comparable>(by keyPath: KeyPath<Element, Value>) -> [Element] {
        return sorted(by: keyPath, using: <)
    }
    
    /// Returns the elements of the sequence, sorted in the increasing order using the given keypath.
    @inlinable
    public func sorted<Value: Comparable>(by keyPath: KeyPath<Element, Value?>) -> [Element] {
        return sorted(by: keyPath) { lhs, rhs in
            guard let lhs else { return true }
            guard let rhs else { return false }
            return lhs < rhs
        }
    }
    
    /// Returns the elements of the sequence, sorted in the increasing order using the given keypath.
    @inlinable
    public func sorted<Value: Comparable>(
        by keyPath1: KeyPath<Element, Value>,
        and keyPath2: KeyPath<Element, Value>
    ) -> [Element] {
        return sorted(by: keyPath1, and: keyPath2, using: <)
    }
    
    /// Returns the elements of the sequence, sorted using the given predicate as the comparison between elements and the keypath.
    @inlinable
    public func sorted<Value>(
        by keyPath: KeyPath<Element, Value>,
        using valuesAreInIncreasingOrder: (Value, Value) throws -> Bool
    ) rethrows -> [Element] {
        return try sorted {
            try valuesAreInIncreasingOrder($0[keyPath: keyPath], $1[keyPath: keyPath])
        }
    }
    
    /// Returns the elements of the sequence, sorted using the given predicate as the comparison between elements, the keypath and the suplementary keypath.
    @inlinable
    public func sorted<Value: Comparable>(
        by keyPath1: KeyPath<Element, Value>,
        and keyPath2: KeyPath<Element, Value>,
        using valuesAreInIncreasingOrder: (Value, Value) throws -> Bool
    ) rethrows -> [Element] {
        return try sorted {
            if $0[keyPath: keyPath1] == $1[keyPath: keyPath1] {
                return try valuesAreInIncreasingOrder($0[keyPath: keyPath2], $1[keyPath: keyPath2])
            } else {
                return try valuesAreInIncreasingOrder($0[keyPath: keyPath1], $1[keyPath: keyPath1])
            }
        }
    }
}
