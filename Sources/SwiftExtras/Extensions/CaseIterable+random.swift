extension CaseIterable {
    
    /// Returns a random case using the given random number generator.
    @inlinable
    public static func random(using generator: inout RandomNumberGenerator) -> Self? {
        return allCases.randomElement(using: &generator)
    }
}
