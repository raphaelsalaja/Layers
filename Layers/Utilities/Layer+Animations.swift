//
//  Layer+Animations.swift
//  Layers
//
//  Created by Raphael Salaja on 01/10/2023.
//

import SwiftUI

struct AnimateParentAction {
    private let action: (Animation?) -> Void
    init(action: @escaping (Animation?) -> Void) {
        self.action = action
    }

    func callAsFunction() {
        action(nil)
    }

    func callAsFunction(overrideAnimation: Animation) {
        action(overrideAnimation)
    }
}

private struct AnimateParentActionKey: EnvironmentKey {
    static var defaultValue: AnimateParentAction = .init(action: { _ in })
}

extension EnvironmentValues {
    var animateParent: AnimateParentAction {
        get { self[AnimateParentActionKey.self] }
        set { self[AnimateParentActionKey.self] = newValue }
    }
}

private struct OnAnimateParentCalledModifier: ViewModifier {
    let animation: Animation
    @State private var animationToggle = false
    @State private var overrideAnimation: Animation?
    func body(content: Content) -> some View {
        content
            .environment(\.animateParent, AnimateParentAction(action: { overrideAnimation in
                self.overrideAnimation = overrideAnimation
                animationToggle.toggle()
            }))
            .animation(overrideAnimation ?? animation, value: animationToggle)
    }
}

extension View {
    func childTriggeredAnimation(animation: Animation) -> some View {
        modifier(OnAnimateParentCalledModifier(animation: animation))
    }
}
