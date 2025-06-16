extension BinaryInteger {
    
    /// Returns `true` if the integer is even.
    @inlinable
    @inline(__always)
    public var isEven: Bool {
        return self & 1 == 0
    }
}
