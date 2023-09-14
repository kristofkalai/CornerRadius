# CornerRadius
CornerRadius has just learned about RTL and border setup! ⛶

## Setup

Add the following to `Package.swift`:

```swift
.package(url: "https://github.com/stateman92/CornerRadius", exact: .init(0, 0, 1))
```

[Or add the package in Xcode.](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

## Usage

```swift
RoundedCornerView(
    corners: [.bottomTrailing, .topLeading],
    border: .init(borderColor: .blue, lineWidth: 5),
    radius: 25.0
) {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundColor(.accentColor)
        Text("Hello, world!")
    }
    .padding()
    .background(Color.red.opacity(0.5))
}
```

For details see the Example app.

## Example

<p style="text-align:center;"><img src="https://github.com/stateman92/CornerRadius/blob/main/Resources/screenshot.png?raw=true" width="50%" alt="Example"></p>
