<p>
    <img src="https://img.shields.io/badge/Swift-6.0-orange.svg" />
    <img src="https://img.shields.io/badge/platform-iOS%20%7C%20macOS-lightgrey.svg">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" />
</p>

# SwiftExtras

This package extends the functionality of the Swift standard library by
providing convenient methods and properties.

## Examples

Provide a default value or check for nil easily:
```swift
let optionalText: String? = nil

if optionalText.isNil {
    print("The text is nil.")
}

let text = optionalText.unwrapped(or: "Default text")
print("Text:", text)
```

Access elements safely:
```swift
let letters = ["A", "B", "C"]
if let letter = letters[safe: 2] {
    print("Letter:", letter)
} else {
    print("Index out of bounds")
}
```

Leverage key path operators to work with collections:
```swift
let names = ["John", "Alexander", "Bob", "Christopher"]

let shortNames = names.filter(\.count < 5)
let containsJohn = names.contains(where: \.self == "John")
```

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
