//
//  LayerExample.swift
//  Eyedee
//
//  Created by Raphael Salaja on 21/09/2023.

import SwiftUI

// MARK: - Example Layer

struct LayerExample: View {
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
            0: [["Cancel": "xmark.circle"], ["Continue": ""]],
            1: [["Cancel": "xmark.circle"], ["Continue": "checkmark.circle"]],
            2: [["Cancel": "xmark.circle"], ["Continue": "checkmark.circle"]],
        ]
    )

    var body: some View {
        Layer {
            layers.getCurrentHeader()
                .id("layer.stack.header.\(layers.index)")

            layers.getCurrentContent()
                .id("layer.stack.content.\(layers.index)")
                .matchedGeometryEffect(
                    id: "layer.image.content",
                    in: LayerConstants.namespace
                )
                .transition(
                    .asymmetric(
                        insertion:
                        .opacity.animation(.default.delay(0.30))
                            .combined(
                                with: .scale(scale: 0.9).animation(.default.delay(0.30))),
                        removal: .opacity
                    )
                )

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
                                background: .green)
                    {
                        layers.next()
                    }
                }
            }
        }
    }
}

// MARK: - Preview

#Preview() {
    ZStack {
        Color(.black.opacity(0.25))
            .ignoresSafeArea()
            .zIndex(1)

        LayerExample()
            .zIndex(2)
    }
}
