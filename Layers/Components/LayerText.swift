//
//  LayerTitle.swift
//  Eyedee
//
//  Created by Raphael Salaja on 19/09/2023.
//

import SwiftUI

private struct FullWidthText: View {
    @State var text: AnyView

    public init<Content>(@ViewBuilder text: @escaping () -> Content) where Content: View {
        self.text = AnyView(text())
    }

    var body: some View {
        HStack {
            text

            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

struct LayerTitle: View {
    @State public var title: String

    var body: some View {
        FullWidthText {
            Text(title).layerTitleStyle()
        }
        .matchedGeometryEffect(
            id: LayerConstants.Animations.Namespaces.title,
            in: LayerConstants.Animations.Namespaces.namespace
        )
        .transition(.opacity.combined(with: .scale(scale: 1.0)))
    }
}

struct LayerDescription: View {
    @State var description: String

    var body: some View {
        FullWidthText {
            Text(description).layerDescriptionStyle()
        }
        .matchedGeometryEffect(
            id: LayerConstants.Animations.Namespaces.description,
            in: LayerConstants.Animations.Namespaces.namespace
        )
        .transition(.opacity.combined(with: .scale(scale: 1.0)))
    }
}

#Preview("Title", traits: .sizeThatFitsLayout) {
    LayerTitle(title: "Heading")
}

#Preview("Description", traits: .sizeThatFitsLayout) {
    LayerDescription(description:
        """
        Consequat cillum amet sint elit ut ut exercitation. Excepteur consectetur pariatur nisi.
        """
    )
}
