//
//  Layer+Extensions.swift
//  Layers
//
//  Created by Raphael Salaja on 06/10/2023.
//

import Foundation
import SwiftUI

// MARK: - Views

/// A view that horizontally aligns its content to fill the available width.
///
/// The `FullWidthText` struct is a convenient way to horizontally align text or any other content to fill the entire
/// available width, optionally centering it within the space.
struct FullWidthText: View {
    /// The text or content to be displayed and aligned within the view.
    @State var text: AnyView

    /// A boolean value that determines whether the content should be centered within the available width.
    @State var center: Bool

    /// Initializes a new instance of the `FullWidthText` view.
    ///
    /// - Parameters:
    ///   - center: A boolean value indicating whether the content should be centered within the available width.
    ///   - text: A closure that generates the text or content to be displayed within the view.
    init<Content>(
        center: Bool = false,
        @ViewBuilder text: @escaping () -> Content
    ) where Content: View {
        self.center = center
        self.text = AnyView(text())
    }

    var body: some View {
        HStack {
            if center { Spacer() }

            text

            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Button Styles

/// A button style that scales its content when pressed.
///
/// The `ScaleButtonStyle` struct provides a button style that scales down its content when pressed, giving a visual
/// feedback effect to indicate interaction.
public struct ScaleButtonStyle: ButtonStyle {
    /// Initializes a new instance of the `ScaleButtonStyle`.
    public init() {}

    /// Creates the view for the button's body.
    ///
    /// - Parameter configuration: The button's configuration.
    /// - Returns: A modified view with the scaling effect applied.
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.85 : 1)
            .transition(.scale(scale: 1.0))
    }
}

public extension ButtonStyle where Self == ScaleButtonStyle {
    /// A convenience property to apply the `ScaleButtonStyle` to a button.
    ///
    /// Use this property to apply the `ScaleButtonStyle` to a button without explicitly creating an instance
    /// of the style.
    ///
    /// Example usage:
    /// ```
    /// Button("Press Me") {
    ///     // Action to perform when the button is pressed
    /// }
    /// .buttonStyle(.scale)
    /// ```
    static var scale: ScaleButtonStyle {
        ScaleButtonStyle()
    }
}

// MARK: - Modifiers

extension Color {
    private enum Luminance {
        static let red: CGFloat = 0.2126
        static let green: CGFloat = 0.7152
        static let blue: CGFloat = 0.0722
        static let threshold: CGFloat = 0.7
    }

    /// A boolean value indicating whether the color is considered dark based on its luminance.
    var isDark: Bool {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0

        guard UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: nil)
        else {
            return false
        }

        let luminance =
            Luminance.red * red +
            Luminance.green * green +
            Luminance.blue * blue

        return luminance < Luminance.threshold
    }
}

/// A view modifier for setting the text color with contrast based on the background color.
struct ContrastTextColor: ViewModifier {
    var background: Color
    var light: Color = .white
    var dark: Color = .black
    var foregroundColor: Color? = nil

    /// Applies text color contrast based on the background color.
    ///
    /// - Parameter content: The content to which the text color contrast is applied.
    /// - Returns: A modified view with the appropriate text color.
    func body(content: Content) -> some View {
        if let fgColor = foregroundColor {
            return content.foregroundColor(fgColor)
        } else {
            return content.foregroundColor(background.isDark ? light : dark)
        }
    }
}

extension View {
    /// Applies text color contrast based on the background color.
    ///
    /// - Parameters:
    ///   - background: The background color used to determine text color contrast.
    ///   - light: The text color to use when the background is considered dark.
    ///   - dark: The text color to use when the background is considered light.
    ///   - foregroundColor: An optional text color to use, which takes precedence over automatic contrast calculation.
    /// - Returns: A modified view with the appropriate text color contrast applied.
    func contrastTextColor(background: Color, light: Color = .white, dark: Color = .black, foregroundColor: Color? = nil) -> some View {
        modifier(ContrastTextColor(background: background, light: light, dark: dark, foregroundColor: foregroundColor))
    }
}
