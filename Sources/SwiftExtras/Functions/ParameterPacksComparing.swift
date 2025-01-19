/// Returns `true` if all corresponding elements in the two tuples are equal.
///
/// This overload lets you compare any two tuples of the same arity
/// whose elements all conform to `Equatable`, e.g. `(Int, String, Bool)`, `(Double, Double)`, etc.
///
/// - Parameters:
///   - lhs: A tuple of `Equatable` values.
///   - rhs: Another tuple of the same shape and `Equatable` types.
/// - Returns: `true` if for every position, `lhs.element == rhs.element`.
@inlinable
public func == <each Element: Equatable>(lhs: (repeat each Element), rhs: (repeat each Element)) -> Bool {
    for (left, right) in repeat (each lhs, each rhs) {
        if !(left == right) {
            return false
        }
    }
    return true
}


/// Returns `true` if any corresponding element in the two tuples differs.
///
/// - Parameters:
///   - lhs: A tuple of `Equatable` values.
///   - rhs: Another tuple of the same shape and `Equatable` types.
/// - Returns: `true` if there exists at least one position where `lhs.element != rhs.element`.
@inlinable
public func != <each Element: Equatable>(lhs: (repeat each Element), rhs: (repeat each Element)) -> Bool {
    for (left, right) in repeat (each lhs, each rhs) {
        if left == right {
            return false
        }
    }
    return true
}
