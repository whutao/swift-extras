extension Collection {
    
    /// A Boolean value indicating whether the collection is NOT empty.
    @inline(__always)
    public var isNotEmpty: Bool {
        return !isEmpty
    }
}
