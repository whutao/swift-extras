#if canImport(Foundation)
import Foundation

// MARK: String

extension Optional where Wrapped == String {
    
    /// Returns `true` if an optional contains a non-empty string value, `false` otherwise.
    ///
    /// A convenient way to write, for example:
    /// ```
    /// let optionalString: String? = ""
    ///
    /// print(optionalString.isNilOrEmpty)
    /// ```
    /// instead of:
    /// ```
    /// let optionalString: String? = ""
    ///
    /// print(optionalString == nil || optionalString == "")
    /// ```
    @inlinable
    public var isNilOrEmpty: Bool {
        return flatMap(\.isEmpty).unwrapped(or: true)
    }
}
#endif

// MARK: Collection

extension Optional where Wrapped: Collection {
    
    /// Returns `true` if an optional contains a non-empty string value, `false` otherwise.
    ///
    /// A convenient way to write, for example:
    /// ```
    /// let optionalCollection: Array<Int>? = []
    ///
    /// print(optionalCollection.isNilOrEmpty)
    /// ```
    /// instead of:
    /// ```
    /// let optionalCollection: Array<Int>? = []
    ///
    /// print(optionalCollection == nil || optionalCollection == [])
    /// ```
    @inlinable
    public var isNilOrEmpty: Bool {
        return flatMap(\.isEmpty).unwrapped(or: true)
    }
}
