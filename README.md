<p>
    <img src="https://img.shields.io/badge/Swift-6.0-orange.svg" />
    <img src="https://img.shields.io/badge/platform-iOS%20%7C%20macOS-lightgrey.svg">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" />
</p>

# SwiftExtras

This package is a collection of extensions and utility types that enhance the Swift standard library.

## Features

- Handy extensions for `Optional`, `Collection`, `String`, `BinaryInteger`, and more.
- Safe collection access and expressive unwrapping.
- Key path operators for concise predicates and sorting.
- Utility types: `Either`, `Pair`, `Box`, `Weak`.

## Examples

### Optionals

Provide a default value, check for nil, or unwrap safely:
```swift
let optionalText: String? = nil

if optionalText.isNil {
    print("The text is nil.")
}

let text = optionalText.unwrapped(or: "Default text")
print("Text:", text)

let empty: String? = ""
print(empty.isNilOrEmpty) // true
```

### Safe Collection Access

Access elements safely:
```swift
let letters = ["A", "B", "C"]
if let letter = letters[safe: 2] {
    print("Letter:", letter)
} else {
    print("Index out of bounds")
}
```

### Key Path Operators & Predicates

Leverage key path operators for expressive filtering and sorting:
```swift
let names = ["John", "Alexander", "Bob", "Christopher"]

let shortNames = names.filter(\.count < 5)
let containsJohn = names.contains(where: \.self == "John")
```

### Numeric Extensions

Check if a number is even, odd, positive, or negative:
```swift
let number = 42
print(number.isEven)      // true
print(number.isOdd)       // false
print(number.isPositive)  // true
print(number.isNegative)  // false
```

### Either Type

`Either` is a generic enum that can hold a value of one of two possible types. Useful for representing dual-type results, error handling, or branching logic.

```swift
let value: Either<String, Int> = .left("Hello")

switch value {
case .left(let string):
    print("String value: \(string)")
case .right(let int):
    print("Int value: \(int)")
}

if value.isLeft {
    // Handle left case
}

let mapped = try? value.mapRight { $0 * 2 }
```

`Either` conforms to `Equatable`, `Hashable`, `Codable`, `Sendable`, and more when its generic parameters do.

### Pair Type

`Pair` is a tuple-like struct that holds two values, possibly of different types.
It supports mapping and protocol conformances.
```swift
let pair = Pair(first: "A", second: 1)
let newPair = try? pair.mapSecond { $0 + 1 } // Pair(first: "A", second: 2)
```

### Weak References

Store weak references to class instances, useful for observer lists or delegate patterns:
```swift
class Observer {
    ...
}
let observer = Observer()
let weakObserver = Weak(observer)
print(weakObserver.value != nil) // true
```

### Box Type

Wrap a value type in a reference type:
```swift
let box = Box(42)
print(box.value) // 42
```

## Installation

You can add the library to an Xcode project by adding it as a package dependency.

> https://github.com/whutao/swift-extras

If you want to use the library in a [SwiftPM](https://swift.org/package-manager/) project,
it's as simple as adding it to a `dependencies` clause in your `Package.swift`:
```swift
dependencies: [
    .package(
        url: "https://github.com/whutao/swift-extras", 
        from: Version(2, 0, 0)
    )
]
```

## License

This library is released under the MIT License. See the [LICENSE](LICENSE) file for more details.
