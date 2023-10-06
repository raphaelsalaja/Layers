//
//  Layer+Extensions.swift
//  Layers
//
//  Created by Raphael Salaja on 06/10/2023.
//

import Foundation
import SwiftUI

struct ScaleButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.85 : 1)
            .transition(.scale(scale: 1.0))
    }
}

struct FullWidthText: View {
    @State var text: AnyView
    @State var center: Bool

    public init<Content>(
        center: Bool = false,
        @ViewBuilder text: @escaping () -> Content) where Content: View
    {
        self.center = center
        self.text = AnyView(text())
    }

    var body: some View {
        HStack {
            if center {
                Spacer()
            }

            text

            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

struct ContrastTextColor: ViewModifier {
    var background: Color
    var light: Color = .white
    var dark: Color = .black

    func body(content: Content) -> some View {
        content
            .foregroundColor(background.isDark ? light : dark)
    }
}

extension View {
    func contrastTextColor(background: Color, light: Color, dark: Color) -> some View {
        modifier(ContrastTextColor(background: background, light: light, dark: dark))
    }
}

extension Color {
    private enum Luminance {
        static let red: CGFloat = 0.2126
        static let green: CGFloat = 0.7152
        static let blue: CGFloat = 0.0722
        static let threshold: CGFloat = 0.7
    }

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

extension ButtonStyle where Self == ScaleButtonStyle {
    static var scale: ScaleButtonStyle {
        ScaleButtonStyle()
    }
}
