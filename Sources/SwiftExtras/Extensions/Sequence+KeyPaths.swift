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
    public func sorted<Value: Comparable>(
        by keyPath: KeyPath<Element, Value>,
        ascending: Bool = true
    ) -> [Element] {
        return sorted(by: keyPath) { lhs, rhs in
            return ascending ? lhs < rhs : lhs > rhs
        }
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
}
