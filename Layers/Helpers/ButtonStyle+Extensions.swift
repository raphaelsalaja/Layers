//
//  ButtonStyle+Extensions.swift
//  Layers
//
//  Created by Raphael Salaja on 02/10/2023.
//

import SwiftUI

struct ScaleButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? Constants.Scale.pressed : 1)
            .transition(.scale(scale: 1.0))
    }
}

extension ButtonStyle where Self == ScaleButtonStyle {
    static var scale: ScaleButtonStyle {
        ScaleButtonStyle()
    }
}
