//
//  Layer+Constants.swift
//  Eyedee
//
//  Created by Raphael Salaja on 29/09/2023.
//

import SwiftUI

public enum LayerConstants {
    enum Styling {
        static let padding: EdgeInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
    }

    enum Animations {
        enum Namespaces {
            static let namespace: Namespace.ID = Namespace().wrappedValue
            static let background = "layer.background"
            static let mask = "layer.mask"
            static let title = "layer.title"
            static let description = "layer.description"
            static let content = "layer.content"
        }

        enum Transitions {
            static let imagePicker: AnyTransition =
                .asymmetric(
                    insertion: .opacity.animation(.default.delay(0.30)).combined(with: .scale(scale: 0.9).animation(.default.delay(0.30))),
                    removal: .opacity
                )
        }
    }
}
