extension Optional {
    
    /// Instead of bare `??` operator.
    ///
    /// A convenient way to write:
    /// ```
    /// let optionalString: String? = nil
    ///
    /// print(optionalString.unwrapped(or: "Default string"))
    /// ```
    /// instead of:
    /// ```
    /// let optionalString: String? = nil
    ///
    /// print(optionalString ?? "Default string")
    /// ```
    @inlinable
    public func unwrapped(or defaultValue: @autoclosure () -> Wrapped) -> Wrapped {
        if let wrapped = self {
            return wrapped
        } else {
            return defaultValue()
        }
    }
    
    /// Instead of `unsafelyUnwrapped` property or bare `!` force unwrap operator.
    ///
    /// A convenient way to write:
    /// ```
    /// let optionalString: String? = "String"
    ///
    /// print(optionalString.unsafelyUnwrapped(because: "Always not nil."))
    /// ```
    /// instead of:
    /// ```
    /// let optionalString: String? = "String"
    ///
    /// // Always not nil.
    /// print(optionalString!)
    /// ```
    @inlinable
    public func unsafelyUnwrapped(
        because assumption: @autoclosure () -> String,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Wrapped {
        if let wrapped = self {
            return wrapped
        } else {
            fatalError("Unexpectedly found nil. Assumption failed: \(assumption()).", file: file, line: line)
        }
    }
    
    /// Returns a wrapped value if an optional can be unwrapped. Otherwise, throw an `error`.
    @inlinable
    public func unwrapped<E: Error>(or error: @autoclosure () -> E) throws(E) -> Wrapped {
        if let wrapped = self {
            return wrapped
        } else {
            throw error()
        }
    }
}
