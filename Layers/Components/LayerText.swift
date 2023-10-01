//
//  LayerTitle.swift
//  Eyedee
//
//  Created by Raphael Salaja on 19/09/2023.
//

import SwiftUI

struct LayerTitle: View {
    @State public var title: String

    var body: some View {
        FullWidthText {
            Text(title).layerTitleStyle()
        }
        .matchedGeometryEffect(
            id: Constants.Animations.Namespaces.title,
            in: Constants.Animations.Namespaces.namespace
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
            id: Constants.Animations.Namespaces.description,
            in: Constants.Animations.Namespaces.namespace
        )
        .transition(.opacity.combined(with: .scale(scale: 1.0)))
    }
}
 
