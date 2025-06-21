/// A tuple type holding two values, possibly of different types.
@frozen
public struct Pair<First: ~Copyable, Second: ~Copyable>: ~Copyable {
    
    /// The first value in the pair.
    public var first: First
    
    /// The second value in the pair.
    public var second: Second
    
    /// Initializes a pair with the given values (move-only).
    public init(first: consuming First, second: consuming Second) {
        self.first = first
        self.second = second
    }
}

// MARK: - Conformances

extension Pair: BitwiseCopyable where First: BitwiseCopyable, Second: BitwiseCopyable {
    
}

extension Pair: Copyable where First: Copyable, Second: Copyable {
    
}

extension Pair: Decodable where First: Decodable, Second: Decodable {
    
}

extension Pair: Encodable where First: Encodable, Second: Encodable {
    
}

extension Pair: Equatable where First: Equatable, Second: Equatable {
    
}

extension Pair: Hashable where First: Hashable, Second: Hashable {
    
}

extension Pair: Sendable where First: Sendable, Second: Sendable {
    
}

// MARK: - Init for copyable

extension Pair where First: Copyable, Second: Copyable {
    
    /// Initializes a pair with the given values.
    public init(first: First, second: Second) {
        self.first = first
        self.second = second
    }
}

// MARK: - Map for ~Copyable

extension Pair where First: ~Copyable, Second: ~Copyable {
    
    /// Returns a new pair by transforming the first value.
    @inlinable
    public consuming func mapFirst<NewFirst, E: Error>(
        _ transform: (borrowing First) throws(E) -> NewFirst
    ) throws(E) -> Pair<NewFirst, Second> {
        return try Pair<NewFirst, Second>(first: transform(first), second: second)
    }
    
    /// Returns a new pair by transforming the second value.
    @inlinable
    public consuming func mapSecond<NewSecond, E: Error>(
        _ transform: (borrowing Second) throws(E) -> NewSecond
    ) throws(E) -> Pair<First, NewSecond> {
        return try Pair<First, NewSecond>(first: first, second: transform(second))
    }
}


// MARK: - Map for Copyable

extension Pair where First: Copyable, Second: Copyable {
    
    /// Returns a new pair by transforming the first value.
    @inlinable
    public func mapFirst<NewFirst, E: Error>(
        _ transform: (First) throws(E) -> NewFirst
    ) throws(E) -> Pair<NewFirst, Second> {
        return try Pair<NewFirst, Second>(first: transform(first), second: second)
    }
    
    /// Returns a new pair by transforming the second value.
    @inlinable
    public func mapSecond<NewSecond, E: Error>(
        _ transform: (Second) throws(E) -> NewSecond
    ) throws(E) -> Pair<First, NewSecond> {
        return try Pair<First, NewSecond>(first: first, second: transform(second))
    }
}
