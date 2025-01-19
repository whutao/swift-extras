extension Comparable {
    
    /// Returns a value clamped within the specified range.
    ///
    /// If the value is less than the lower bound, the lower bound is returned.
    /// If the value is greater than the upper bound, the upper bound is returned.
    /// Otherwise, the value itself is returned.
    ///
    /// - Parameter range: The closed range within which to clamp the value.
    /// - Returns: A value constrained within the given range.
    @inlinable
    public func clamped(to range: ClosedRange<Self>) -> Self {
        return min(range.upperBound, max(range.lowerBound, self))
    }
}
