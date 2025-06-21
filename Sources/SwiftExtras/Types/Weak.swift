/// A wrapper that weakly references an object.
public final class Weak<Value: AnyObject> {
    
    /// The weakly referenced object.
    public private(set) weak var value: Value?
    
    /// Creates the wrapper with an optional object.
    public init(_ value: Value? = nil) {
        self.value = value
    }
}

extension Weak: Equatable where Value: Equatable {
    
    public static func == (lhs: Weak<Value>, rhs: Weak<Value>) -> Bool {
        return lhs.value == rhs.value
    }
}
