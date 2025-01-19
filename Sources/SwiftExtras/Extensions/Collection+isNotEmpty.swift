extension Collection {
    
    /// A Boolean value indicating whether the collection is NOT empty.
    @inlinable
    @inline(__always)
    public var isNotEmpty: Bool {
        return !isEmpty
    }
}
