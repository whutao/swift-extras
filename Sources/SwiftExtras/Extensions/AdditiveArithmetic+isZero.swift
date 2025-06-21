extension AdditiveArithmetic {
    
    /// Returns `true` if the value is zero.
    @inlinable
    @inline(__always)
    public var isZero: Bool {
        return self == .zero
    }
    
    /// Returns `true` if the value is not zero.
    @inlinable
    @inline(__always)
    public var isNotZero: Bool {
        return !isZero
    }
}
