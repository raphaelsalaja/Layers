<p align="center">
    <img src="https://img.shields.io/badge/iOS-16.0+-blue.svg" />
    <img src="https://img.shields.io/badge/-SwiftUI-red.svg" />
    <a href="https://twitter.com/raphaelsalaja">
        <img src="https://img.shields.io/badge/Contact-@raphaelsalaja-lightgrey.svg?style=social&logo=twitter" alt="Twitter: @raphaelsalaja" />
    </a>
</p>

https://github.com/rafunderscore/Layers/assets/52125687/5ca08ccc-1989-4c90-8a96-683bdf59329c

Layers is a powerful SwiftUI library designed for creating layered user interfaces, enhancing your app's user experience with smooth and performant animations between modal views.

## Vision

While Layers isn't a perfect solution, it's a solid starting point. We believe in the power of open source and want the community to contribute and build upon Layers. If you have any suggestions or would like to contribute, please feel free to open an issue.

## Usage

To get started with Layers:

1. Download the repository and check out the example.
2. For integration into your own projects, copy the source folder into your project.
> We have plans to convert this project into a package for easier updates in the future.

### Creating Layers

To create your own Layer, follow these steps:

```swift
@Bindable var layers: LayerModel = .init(
    index: 0,
    max: 3,
    headers: [
        0: AnyView(ExampleHeader1()),
        1: AnyView(ExampleHeader2()),
        2: AnyView(ExampleHeader3()),
    ],
    contents: [
        0: AnyView(ExampleContent1()),
        1: AnyView(ExampleContent2()),
        2: AnyView(ExampleContent3()),
    ],
    buttons: [
        0: [["Cancel": "xmark.circle"], ["Continue": "checkmark.circle"]],
        1: [["Cancel": "xmark.circle"], ["Continue": "checkmark.circle"]],
        2: [["Cancel": "xmark.circle"], ["Continue": "checkmark.circle"]],
    ]
)
```

Within your view, create content wrapped within a Layer:

```swift
var body: some View {
    Layer {
        layers.getCurrentHeader()
            .id("layer.stack.header.\(layers.index)")

        layers.getCurrentContent()
            .id("layer.stack.content.\(layers.index)")

        HStack {
            if !layers.getCurrentButtons()[0].isEmpty {
                LayerButton(text: Binding.constant(layers.getCurrentButtons()[0].keys.first ?? ""),
                            icon: Binding.constant(layers.getCurrentButtons()[0].values.first ?? ""),
                            background: .orange)
                {
                    layers.previous()
                }
            }
            if !layers.getCurrentButtons()[1].isEmpty {
                LayerButton(text: Binding.constant(layers.getCurrentButtons()[1].keys.first ?? ""),
                            icon: Binding.constant(layers.getCurrentButtons()[1].values.first ?? ""),
                            background: .blue)
                {
                    layers.next()
                }
            }
        }
    }
}
```

This setup allows you to customize your layers extensively without diving into numerous pages or extraneous files. Future iterations will further streamline this workflow.

## Contributing

We welcome and encourage contributions to this project. If you have bug fixes or new features in mind, please create a new issue to discuss them. If you're interested in contributing code, fork the repository and submit a pull request. Make sure to document your changes and thoroughly test the project before submitting a pull request. Maintain consistency with the project's code style.

## Disclaimer

This project is open source under the MIT license, granting you full access to the source code for modifications to suit your needs. Please note that this project is in beta, so there may be bugs or areas for improvement. If you discover any issues or have suggestions, please report them by creating a new issue.
