extension Array {
    
    /// Initializes an empty array and reserves the specified minimum capacity.
    @inlinable
    public init(reservingCapacity minimumCapacity: Int) {
        self = Array()
        reserveCapacity(minimumCapacity)
    }
}
