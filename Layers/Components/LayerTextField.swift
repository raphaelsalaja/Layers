//
//  LayerTextfield.swift
//  Eyedee
//
//  Created by Raphael Salaja on 22/09/2023.
//

import SwiftUI

/// The size variations for a `LayerTextField`.
///
/// The `LayerTextField` provides five size variations, ranging from extra small to extra large.
/// These affect the maximum number of lines of text that can be displayed in the text field.
enum LayerTextFieldSize: Int {
    /// The extra small variation for a `LayerTextField`.
    case extraSmall = 1

    /// The small variation for a `LayerTextField`.
    case small = 2

    /// The medium variation for a `LayerTextField`.
    case medium = 3

    /// The large variation for a `LayerTextField`.
    case large = 4

    /// The extra large variation for a `LayerTextField`.
    case extraLarge = 5
}

/// A custom text field control with various size variations and styling options.
///
/// The `LayerTextField` allows you to create text fields with different sizes and styles.
/// It provides options to customize the input text, placeholder text, and visual appearance.
///
/// ```swift
/// struct ContentView: View {
///     @State private var username: String = ""
///
///     var body: some View {
///         LayerTextField(input: $username, placeholder: "Username", variation: .medium)
///     }
/// }
/// ```
///
/// - Parameters:
///   - input: A binding to the input text displayed in the text field.
///   - placeholder: The placeholder text displayed when the text field is empty.
///   - variation: The size variation for the text field, ranging from extra small to extra large.
///
struct LayerTextField: View {
    @State var input: String
    @State var placeholder: String
    @State var variation: LayerTextFieldSize

    internal init(
        input: String,
        placeholder: String,
        variation: LayerTextFieldSize
    ) {
        self.input = input
        self.placeholder = placeholder
        self.variation = variation
    }

    var body: some View {
        TextField(placeholder, text: $input, axis: .vertical)
            .font(.system(.body, design: .rounded).weight(.medium))
            .multilineTextAlignment(.leading)
            .padding(20)
            .foregroundColor(Color(.label))
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .lineLimit(variation.rawValue, reservesSpace: true)
    }
}

#Preview("Extra Small", traits: .sizeThatFitsLayout) {
    LayerTextField(
        input: "",
        placeholder: "Placeholder",
        variation: .extraSmall
    )
    .padding()
}

#Preview("Small", traits: .sizeThatFitsLayout) {
    LayerTextField(
        input: "",
        placeholder: "Placeholder",
        variation: .small
    )
    .padding()
    .previewLayout(.sizeThatFits)
}

#Preview("Medium", traits: .sizeThatFitsLayout) {
    LayerTextField(
        input: "",
        placeholder: "Placeholder",
        variation: .medium
    )
    .padding()
    .previewLayout(.sizeThatFits)
}

#Preview("Large", traits: .sizeThatFitsLayout) {
    LayerTextField(
        input: "",
        placeholder: "Placeholder",
        variation: .large
    )
    .padding()
    .previewLayout(.sizeThatFits)
}

#Preview("Extra Large", traits: .sizeThatFitsLayout) {
    LayerTextField(
        input: "",
        placeholder: "Placeholder",
        variation: .extraLarge
    )
    .padding()
    .previewLayout(.sizeThatFits)
}
