//
//  LayerPadding.swift
//  Eyedee
//
//  Created by Raphael Salaja on 29/09/2023.
//

import SwiftUI

struct LayerPadding: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(LayerConstants.Styling.padding)
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

extension View {
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
