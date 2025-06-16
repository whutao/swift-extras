extension BinaryInteger {
    
    /// Returns `true` if the integer is odd.
    @inlinable
    @inline(__always)
    public var isOdd: Bool {
        return !isEven
    }
}
