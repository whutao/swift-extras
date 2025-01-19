import Foundation

extension String {
    
    /// Returns `true` if every character in this string belongs to the given `CharacterSet`.
    ///
    /// - Parameter characterSet: The set of Unicode scalars to allow.
    /// - Returns: `true` if the string is non‐empty and all of its characters are members of `characterSet`; otherwise `false`.
    ///
    /// # Examples
    ///
    /// ```swift
    /// "12345".contains(onlyCharactersIn: .decimalDigits)      // true
    /// "12a45".contains(onlyCharactersIn: .decimalDigits)      // false
    /// "1A2B".contains(onlyCharactersIn: .alphanumerics)       // true
    /// "".contains(onlyCharactersIn: .letters)                 // true  (empty string has no violating characters)
    /// ```
    @inlinable
    public func contains(onlyCharactersIn characterSet: CharacterSet) -> Bool {
        return unicodeScalars.allSatisfy(characterSet.contains(_:))
    }
}
