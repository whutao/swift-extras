extension RandomAccessCollection {
    
    /// The `safe` subscript allows accessing an element at a given index safely by returning an optional.
    ///
    /// If the index is within the collection's bounds, it returns the element at that index; otherwise,
    /// it returns `nil`. This prevents out-of-bounds runtime errors when accessing elements.
    @inlinable
    public subscript(safe index: Index) -> Element? {
        get {
            guard indices.contains(index) else {
                return nil
            }
            return self[index]
        }
    }
}
