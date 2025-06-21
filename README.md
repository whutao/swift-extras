<p>
    <img src="https://img.shields.io/badge/Swift-6.0-orange.svg" />
    <img src="https://img.shields.io/badge/platform-iOS%20%7C%20macOS-lightgrey.svg">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" />
</p>

# SwiftExtras

This package extends the functionality of the Swift standard library by
providing convenient methods and properties.

## Examples

### Optionals

Provide a default value or check for nil easily:
```swift
let optionalText: String? = nil

if optionalText.isNil {
    print("The text is nil.")
}

let text = optionalText.unwrapped(or: "Default text")
print("Text:", text)
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

### Key Path Operators

Leverage key path operators to work with collections:
```swift
let names = ["John", "Alexander", "Bob", "Christopher"]

let shortNames = names.filter(\.count < 5)
let containsJohn = names.contains(where: \.self == "John")
```

### Numeric Extensions

Check if a number is even or odd:
```swift
let number = 42
print(number.isEven) // true
print(number.isOdd)  // false
```

### Either Type

`Either` is a generic enum that can hold a value of one of two possible types.
It is useful for representing any other dual-type scenario.

```swift
let value: Either<String, Int> = .left("Hello")

switch value {
case .left(let string):
    print("String value: \(string)")
case .right(let int):
    print("Int value: \(int)")
}
```

You can use helper properties and methods:
```swift
if value.isLeft {
    // Handle left case
}

let mapped = value.mapRight { $0 * 2 }
```

`Either` conforms to `Equatable`, `Hashable`, `Codable`, `Sendable`,
and more when its generic parameters do.

## Installation

You can add the library to an Xcode project by adding it as a package dependency.

> https://github.com/whutao/swift-extras

If you want to use the library in a [SwiftPM](https://swift.org/package-manager/) project,
it's as simple as adding it to a `dependencies` clause in your `Package.swift`:

``` swift
dependencies: [
    .package(
        url: "https://github.com/whutao/swift-extras", 
        from: Version(1, 0, 0)
    )
]
```

## License

This library is released under the MIT License. See the [LICENSE](LICENSE) file for more details.
