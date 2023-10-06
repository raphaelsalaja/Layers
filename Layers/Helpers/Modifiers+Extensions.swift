//
//  Modifiers+Extensions.swift
//  Layers
//
//  Created by Raphael Salaja on 02/10/2023.
//

import SwiftUI

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
