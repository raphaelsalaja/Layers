//
//  LayerStack.swift
//  Eyedee
//
//  Created by Raphael Salaja on 29/09/2023.
//

import SwiftUI

struct LayerStack: View {
    @Namespace private var layer

    var content: AnyView

    public init<Content>(
        @ViewBuilder content: @escaping () -> Content) where Content: View
    {
        self.content = AnyView(content())
    }

    var body: some View {
        VStack {
            Spacer()

            ZStack {
                VStack(alignment: .leading, spacing: 24) {
                    content
                }
                .padding(32)
                .frame(maxWidth: .infinity)
                .background(
                    Color(Constants.Colors.background)
                        .matchedGeometryEffect(
                            id: Constants.Animations.Namespaces.background,
                            in: Constants.Animations.Namespaces.namespace
                        )
                )
                .mask {
                    RoundedRectangle(cornerRadius: 32, style: .continuous)
                        .matchedGeometryEffect(
                            id: Constants.Animations.Namespaces.mask,
                            in: Constants.Animations.Namespaces.namespace
                        )
                }
            }
        }
        .padding(
            EdgeInsets(
                top: 0,
                leading: 16,
                bottom: 0,
                trailing: 16
            )
        )
    }
}

#Preview {
    ZStack {
        LayerBackground()

        LayerStack {
            VStack {}
        }
    }
}
