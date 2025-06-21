extension AdditiveArithmetic where Self: Comparable {
    
    /// Returns `true` if the value is greater than zero.
    @inlinable
    @inline(__always)
    public var isPositive: Bool {
        return self > .zero
    }
    
    /// Returns `true` if the value is zero or negative.
    @inlinable
    @inline(__always)
    public var isNotPositive: Bool {
        return !isPositive
    }
}
