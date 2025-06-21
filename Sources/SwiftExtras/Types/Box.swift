/// A reference wrapper for any value type.
public final class Box<Value> {
    
    /// The wrapped value.
    public let value: Value
    
    /// Creates the box with a value.
    public init(_ value: Value) {
        self.value = value
    }
}

// MARK: - Coding keys

extension Box {
    
    enum CodingKeys: String, CodingKey {
        case value
    }
}

// MARK: - Conformances

extension Box: Decodable where Value: Decodable {
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let value = try container.decode(Value.self, forKey: .value)
        self.init(value)
    }
}

extension Box: Encodable where Value: Encodable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

extension Box: Equatable where Value: Equatable {
    
    public static func == (lhs: Box<Value>, rhs: Box<Value>) -> Bool {
        return lhs.value == rhs.value
    }
}

extension Box: Hashable where Value: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}

extension Box: Sendable where Value: Sendable {
    
}
