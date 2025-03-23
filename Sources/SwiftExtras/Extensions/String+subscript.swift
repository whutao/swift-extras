extension String {
    
    /// Used to access and modify a character in the string.
    @inlinable
    public subscript(_ i: Int) -> Character {
        get {
            return self[index(startIndex, offsetBy: i)]
        }
        set {
            let i = index(startIndex, offsetBy: i)
            replaceSubrange(i...i, with: [newValue])
        }
    }
    
    /// Used to access and modify a substring in the string.
    @inlinable
    public subscript(_ range: CountableRange<Int>) -> String {
        get {
            let start = index(startIndex, offsetBy: range.lowerBound)
            let end = index(start, offsetBy: range.upperBound - range.lowerBound)
            return String(self[start..<end])
        }
        set {
            let start = index(startIndex, offsetBy: range.lowerBound)
            let end = index(start, offsetBy: range.upperBound - range.lowerBound)
            replaceSubrange(start..<end, with: newValue.map(Character.init))
        }
    }
}
