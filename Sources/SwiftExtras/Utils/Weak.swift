/// A wrapper that weakly references an object.
///
/// ```swift
/// // Example of storing an array of weak references
/// class Observer { }
///
/// var observer1: Observer? = Observer()
/// var observer2: Observer? = Observer()
///
/// // Wrap each observer weakly
/// var weakObservers: [Weak<Observer>] = [Weak(observer1), Weak(observer2)]
///
/// // Check active observers
/// print(weakObservers.compactMap(\.wrappedValue).count)  // 2
///
/// // After deallocating observer1
/// observer1 = nil
/// print(weakObservers.compactMap(\.wrappedValue).count)  // 1
/// ```
@propertyWrapper
public final class Weak<Value: AnyObject> {
    
    private weak var value: Value?
    
    public init(_ wrappedValue: Value? = nil) {
        self.value = wrappedValue
    }
    
    public var wrappedValue: Value? {
        get { value }
        set { value = newValue }
    }
}

extension Weak: Equatable where Value: Equatable {
    
    public static func == (lhs: Weak<Value>, rhs: Weak<Value>) -> Bool {
        return lhs.value == rhs.value
    }
}
