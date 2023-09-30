//
//  LayerPadding.swift
//  Eyedee
//
//  Created by Raphael Salaja on 29/09/2023.
//

import SwiftUI

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
            .foregroundColor(Color(.systemGray))
    }
}

struct ScaleButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? Constants.Scale.pressed : 1)
            // .brightness(configuration.isPressed ? Constants.Scale.brightness : 0)
            .animation(.easeOut, value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == ScaleButtonStyle {
    static var scale: ScaleButtonStyle {
        ScaleButtonStyle()
    }
}

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
}
