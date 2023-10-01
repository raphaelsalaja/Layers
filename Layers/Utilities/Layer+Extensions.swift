//
//  LayerPadding.swift
//  Eyedee
//
//  Created by Raphael Salaja on 29/09/2023.
//

import SwiftUI

// MARK: - ViewModifier

struct Plain: ViewModifier {
    func body(content: Content) -> some View {
        content
            .transition(.scale(scale: 1.0))
    }
}

struct LayerPadding: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(Constants.Styling.padding)
    }
}

struct LayerTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title3, design: .rounded, weight: .bold))
    }
}

struct LayerDescriptionStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.headline, design: .rounded, weight: .medium))
            .minimumScaleFactor(0.1)
            .foregroundColor(Color(.systemGray))
    }
}

struct LayerButtonStyle: ViewModifier {
    var color: Color

    func body(content: Content) -> some View {
        content
            .fixedSize()
            .font(.body)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .foregroundColor(color.isDark ? Color.white : Color.black)
    }
}

// MARK: - ButtonStyle

struct ScaleButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? Constants.Scale.pressed : 1)
            .transition(.scale(scale: 1.0))
//            .animation(.linear, value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == ScaleButtonStyle {
    static var scale: ScaleButtonStyle {
        ScaleButtonStyle()
    }
}

// MARK: - Color

extension Color {
    var isDark: Bool {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0

        guard UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: nil)
        else {
            return false
        }

        let luminance =
            Constants.Luminance.red * red +
            Constants.Luminance.green * green +
            Constants.Luminance.blue * blue

        return luminance < Constants.Luminance.threshold
    }
}

// MARK: - View

extension View {
    func plainTransition() -> some View {
        modifier(Plain())
    }

    func layerPadding() -> some View {
        modifier(LayerPadding())
    }

    func layerTitleStyle() -> some View {
        modifier(LayerTitleStyle())
    }

    func layerDescriptionStyle() -> some View {
        modifier(LayerDescriptionStyle())
    }

    func layerButtonStyle(color color: Color) -> some View {
        modifier(LayerButtonStyle(color: color))
    }
}
