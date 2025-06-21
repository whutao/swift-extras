/// A type that can hold a value of either `Left` or `Right`.
@frozen
public enum Either<Left: ~Copyable, Right: ~Copyable>: ~Copyable {
    
    /// Holds a value of type `Left`.
    case left(Left)
    
    /// Holds a value of type `Right`.
    case right(Right)
}

// MARK: - Conformances

extension Either: BitwiseCopyable where Left: BitwiseCopyable, Right: BitwiseCopyable {
    
}

extension Either: Copyable where Left: Copyable, Right: Copyable {
    
}

extension Either: Decodable where Left: Decodable, Right: Decodable {
    
}

extension Either: Encodable where Left: Encodable, Right: Encodable {
    
}

extension Either: Error where Left: Error, Right: Error {
    
}

extension Either: Equatable where Left: Equatable, Right: Equatable {
    
}

extension Either: Hashable where Left: Hashable, Right: Hashable {
    
}

extension Either: Sendable where Left: Sendable, Right: Sendable {
    
}

// MARK: - Properties for ~Copyable

extension Either where Left: ~Copyable, Right: ~Copyable {
    
    /// Returns `true` if the value is a `.left`.
    @inlinable
    public var isLeft: Bool {
        consuming get {
            if case .left = consume self {
                return true
            } else {
                return false
            }
        }
    }
    
    /// Returns `true` if the value is a `.right`.
    @inlinable
    public var isRight: Bool {
        consuming get {
            if case .right = consume self {
                return true
            } else {
                return false
            }
        }
    }
}

// MARK: - Properties for Copyable

extension Either where Left: Copyable, Right: Copyable {
    
    /// Returns `true` if the value is a `.left`.
    @inlinable
    public var isLeft: Bool {
        if case .left = self {
            return true
        } else {
            return false
        }
    }
    
    /// Returns `true` if the value is a `.right`.
    @inlinable
    public var isRight: Bool {
        if case .right = self {
            return true
        } else {
            return false
        }
    }
}

// MARK: - Fold for ~Copyable

extension Either where Left: ~Copyable, Right: ~Copyable {
    
    /// Applies the corresponding closure to the stored value depending on whether it's `.left` or `.right`.
    ///
    /// This provides a way to exhaustively handle both cases and unify them into a single return value.
    @inlinable
    public consuming func fold<F>(left: (borrowing Left) -> F, right: (borrowing Right) -> F) -> F {
        switch consume self {
        case let .left(value):
            return left(value)
        case let .right(value):
            return right(value)
        }
    }
}

// MARK: - Fold for Copyable

extension Either where Left: Copyable, Right: Copyable {
    
    /// Applies the corresponding closure to the stored value depending on whether it's `.left` or `.right`.
    ///
    /// This provides a way to exhaustively handle both cases and unify them into a single return value.
    @inlinable
    public func fold<F>(left: (borrowing Left) -> F, right: (borrowing Right) -> F) -> F {
        switch self {
        case let .left(value):
            return left(value)
        case let .right(value):
            return right(value)
        }
    }
}

// MARK: - Map for ~Copyable

extension Either where Left: ~Copyable, Right: ~Copyable {
    
    /// Transforms the `Left` value using the given closure.
    @inlinable
    public consuming func mapLeft<NewLeft>(_ transform: (borrowing Left) -> NewLeft) -> Either<NewLeft, Right> {
        switch consume self {
        case let .left(value):
            return .left(transform(value))
        case let .right(value):
            return .right(value)
        }
    }
    
    /// Transforms the `Right` value using the given closure.
    @inlinable
    public consuming func mapRight<NewRight>(_ transform: (borrowing Right) -> NewRight) -> Either<Left, NewRight> {
        switch consume self {
        case let .left(value):
            return .left(value)
        case let .right(value):
            return .right(transform(value))
        }
    }
    
    /// Transforms the `Left` value into a new `Either` using the given closure.
    @inlinable
    public consuming func flatMapLeft<NewLeft>(
        _ transform: (borrowing Left) -> Either<NewLeft, Right>
    ) -> Either<NewLeft, Right> {
        switch consume self {
        case let .left(value):
            return transform(value)
        case let .right(value):
            return .right(value)
        }
    }
    
    /// Transforms the `Right` value into a new `Either` using the given closure.
    @inlinable
    public consuming func flatMapRight<NewRight>(
        _ transform: (borrowing Right) -> Either<Left, NewRight>
    ) -> Either<Left, NewRight> {
        switch consume self {
        case let .left(value):
            return .left(value)
        case let .right(value):
            return transform(value)
        }
    }
}

// MARK: - Map for Copyable

extension Either where Left: Copyable, Right: Copyable {
    
    /// Transforms the `Left` value using the given closure.
    @inlinable
    public consuming func mapLeft<NewLeft>(_ transform: (Left) -> NewLeft) -> Either<NewLeft, Right> {
        switch self {
        case let .left(value):
            return .left(transform(value))
        case let .right(value):
            return .right(value)
        }
    }
    
    /// Transforms the `Right` value using the given closure.
    @inlinable
    public func mapRight<NewRight>(_ transform: (Right) -> NewRight) -> Either<Left, NewRight> {
        switch self {
        case let .left(value):
            return .left(value)
        case let .right(value):
            return .right(transform(value))
        }
    }
    
    /// Transforms the `Left` value into a new `Either` using the given closure.
    @inlinable
    public func flatMapLeft<NewLeft>(
        _ transform: (borrowing Left) -> Either<NewLeft, Right>
    ) -> Either<NewLeft, Right> {
        switch self {
        case let .left(value):
            return transform(value)
        case let .right(value):
            return .right(value)
        }
    }
    
    /// Transforms the `Right` value into a new `Either` using the given closure.
    @inlinable
    public func flatMapRight<NewRight>(
        _ transform: (borrowing Right) -> Either<Left, NewRight>
    ) -> Either<Left, NewRight> {
        switch self {
        case let .left(value):
            return .left(value)
        case let .right(value):
            return transform(value)
        }
    }
}
