extension Optional {
    
    /// Unwraps the optional or throws the provided error.
    ///
    /// This operator acts like the standard `??`, but if `lhs` is `nil`
    /// it will throw the error produced by the autoclosure `rhs()`.
    ///
    /// - Parameters:
    ///   - lhs: The optional to unwrap.
    ///   - rhs: An autoclosure producing the `Error` to throw if `lhs` is `nil`.
    /// - Returns: The wrapped if `lhs` is non‐`nil`.
    /// - Throws: The error returned by `rhs()` if `lhs` is `nil`.
    @inlinable
    public static func ?? <E: Error>(lhs: Self, rhs: @autoclosure () -> E) throws(E) -> Wrapped {
        return try lhs.unwrapped(or: rhs())
    }
    
    /// Unwraps the optional or invokes the provided “never” autoclosure.
    ///
    /// Use this when you want a custom “unreachable” path—e.g. calling
    /// `fatalError()`—instead of providing a default value.
    ///
    /// - Parameters:
    ///   - lhs: The optional to unwrap.
    ///   - rhs: An autoclosure returning `Never` (for example, a call to `fatalError()`).
    /// - Returns: The wrapped if `lhs` is non‐`nil`.
    /// - Note: If `lhs` is `nil`, `rhs()` is invoked, which never returns.
    @inlinable
    public static func ?? (lhs: Self, rhs: @autoclosure () -> Never) -> Wrapped {
        if let lhs {
            return lhs
        } else {
            rhs()
        }
    }
}
