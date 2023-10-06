//
//  Layer+Constants.swift
//  Eyedee
//
//  Created by Raphael Salaja on 29/09/2023.
//

import SwiftUI

public enum LayerConstants {
    static let namespace: Namespace.ID = Namespace().wrappedValue
}


public enum Constants {


    enum Scale {
        static let pressed: CGFloat = 0.85
        static let brightness: CGFloat = 0.85
    }

    enum Animations {
        enum Namespaces {
            static let namespace: Namespace.ID = Namespace().wrappedValue

            static let background = "layer.background"
            static let mask = "layer.mask"
            static let title = "layer.title"
            static let description = "layer.description"
            static let content = "layer.content"
            enum Button {
                static let text = "layer.button.text"
                static let icon = "layer.button.icon"
            }
        }

        enum Transitions {
            static let imagePicker: AnyTransition =
                .asymmetric(
                    insertion: .opacity.animation(.default.delay(0.30)).combined(with: .scale(scale: 0.9).animation(.default.delay(0.30))),
                    removal: .opacity
                )
        }
    }

    enum Colors {
        static let background: Color = .init(.systemBackground)
    }
}
