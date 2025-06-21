extension Result {
    
    /// Transforms this result by applying one of two closures depending on whether it is a success or failure.
    ///
    /// - Parameters:
    ///   - success: A closure to invoke if this `Result` is `.success`, receiving the wrapped success value.
    ///   - failure: A closure to invoke if this `Result` is `.failure`, receiving the wrapped error value.
    /// - Returns: The value returned by the invoked closure.
    @inlinable
    public func fold<T>(success: (Success) -> T, failure: (Failure) -> T) -> T {
        switch self {
        case let .success(value):
            return success(value)
        case let .failure(value):
            return failure(value)
        }
    }
}

extension Result where Success: ~Copyable {
    
    /// Transforms this result by applying one of two closures depending on whether it is a success or failure.
    ///
    /// - Parameters:
    ///   - success: A closure to invoke if this `Result` is `.success`, receiving the wrapped success value.
    ///   - failure: A closure to invoke if this `Result` is `.failure`, receiving the wrapped error value.
    /// - Returns: The value returned by the invoked closure.
    @inlinable
    public consuming func fold<T>(success: (borrowing Success) -> T, failure: (Failure) -> T) -> T {
        switch consume self {
        case let .success(value):
            return success(value)
        case let .failure(value):
            return failure(value)
        }
    }
}
