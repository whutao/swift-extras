extension AdditiveArithmetic where Self: Comparable {
    
    /// Returns `true` if the value is less than zero.
    @inlinable
    @inline(__always)
    public var isNegative: Bool {
        return self < .zero
    }
    
    /// Returns `true` if the value is zero or positive.
    @inlinable
    @inline(__always)
    public var isNotNegative: Bool {
        return !isNegative
    }
}
