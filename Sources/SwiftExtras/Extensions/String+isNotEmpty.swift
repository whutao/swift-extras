extension String {
    
    /// A Boolean value indicating whether the string is NOT empty.
    @inlinable
    @inline(__always)
    public var isNotEmpty: Bool {
        return !isEmpty
    }
}
