//
//  Modifiers+Extensions.swift
//  Layers
//
//  Created by Raphael Salaja on 02/10/2023.
//

import SwiftUI

// MARK: - Transition

struct SimpleTransition: ViewModifier {
    func body(content: Content) -> some View {
        content
            .transition(.scale(scale: 1.0))
    }
}

extension View {
    func simpleTransition() -> some View {
        modifier(SimpleTransition())
    }
}

// MARK: - Layer

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

extension View {
    func layerTitleStyle() -> some View {
        modifier(LayerTitleStyle())
    }

    func layerDescriptionStyle() -> some View {
        modifier(LayerDescriptionStyle())
    }

    func layerButtonStyle(color: Color) -> some View {
        modifier(LayerButtonStyle(color: color))
    }
}
