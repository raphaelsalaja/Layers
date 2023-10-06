//
//  LayerExampleComponents.swift
//  Layers
//
//  Created by Raphael Salaja on 06/10/2023.
//

import SwiftUI

// MARK: - Example Text Fields

struct ExampleTextField: View {
    enum ExampleTextFieldSize: Int {
        case extraSmall = 1
        case small = 2
        case medium = 3
        case large = 4
        case extraLarge = 5
    }

    @State var input: String
    @State var placeholder: String
    @State var variation: ExampleTextFieldSize

    internal init(
        input: String,
        placeholder: String,
        variation: ExampleTextFieldSize
    ) {
        self.input = input
        self.placeholder = placeholder
        self.variation = variation
    }

    var body: some View {
        TextField(placeholder, text: $input, axis: .vertical)
            .font(.system(.body, design: .rounded).weight(.medium))
            .multilineTextAlignment(.leading)
            .padding(20)
            .foregroundColor(Color(.label))
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .lineLimit(variation.rawValue, reservesSpace: true)
    }
}

// MARK: - Example Icons

struct ExampleIcon: View {
    @State public var icon: String

    internal init(icon: String, action: (() -> Void)? = nil) {
        self.icon = icon
    }

    var body: some View {
        Button(action: {}) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .fontWeight(.black)
                .fontDesign(.rounded)
                .scaleEffect(0.416)
                .foregroundColor(Color(.systemGray))
                .background(Color(.systemGray6))
                .clipShape(Circle())
        }
    }
}

// MARK: - Example Headers

struct ExampleHeader1: View {
    @Namespace var namespace

    var body: some View {
        HStack {
            ExampleIcon(icon: "questionmark")
                .matchedGeometryEffect(
                    id: "layer.icon.left",
                    in: LayerConstants.namespace
                )

            FullWidthText(center: true) {
                Text("Heading 1")
                    .fixedSize()
                    .font(.system(.title3, design: .rounded, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .transition(.scale(scale: 1.0))
                    .matchedGeometryEffect(
                        id: "layer.header",
                        in: LayerConstants.namespace
                    )
            }

            ExampleIcon(icon: "xmark")
                .matchedGeometryEffect(
                    id: "layer.icon.right",
                    in: LayerConstants.namespace
                )
        }
    }
}

struct ExampleHeader2: View {
    @Namespace var namespace

    var body: some View {
        HStack {
            FullWidthText {
                Text("Heading 2")
                    .fixedSize()
                    .font(.system(.title3, design: .rounded, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .transition(.scale(scale: 1.0))
                    .matchedGeometryEffect(
                        id: "layer.header",
                        in: LayerConstants.namespace
                    )
            }

            ExampleIcon(icon: "xmark")
                .matchedGeometryEffect(
                    id: "layer.icon.right",
                    in: LayerConstants.namespace
                )
        }
    }
}

struct ExampleHeader3: View {
    @Namespace var namespace

    var body: some View {
        HStack {
            ExampleIcon(icon: "questionmark")
                .matchedGeometryEffect(
                    id: "layer.icon.left",
                    in: LayerConstants.namespace
                )

            FullWidthText(center: true) {
                Text("Heading 3")
                    .fixedSize()
                    .font(.system(.title3, design: .rounded, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .transition(.scale(scale: 1.0))
                    .matchedGeometryEffect(
                        id: "layer.header",
                        in: LayerConstants.namespace
                    )
            }

            ExampleIcon(icon: "xmark")
                .matchedGeometryEffect(
                    id: "layer.icon.right",
                    in: LayerConstants.namespace
                )
        }
    }
}

// MARK: - Example Content

struct ExampleContent1: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.tertiarySystemFill))
                .frame(maxWidth: 300, maxHeight: 64)
        }
    }
}

struct ExampleContent2: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(.systemGray4))
            .frame(maxWidth: 300, maxHeight: 100)
            .shadow(color: Color(.systemGray4), radius: 10, x: 0, y: 5)
    }
}

struct ExampleContent3: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(.systemGray4))
            .frame(maxWidth: 300, maxHeight: 150)
            .shadow(color: Color(.systemGray4), radius: 10, x: 0, y: 5)
    }
}

// MARK: - Example Buttons

struct LayerButton: View {
    @Binding var text: String
    @Binding var icon: String

    @State var id: Int
    @State var background: Color
    @State var disabled: Bool
    @State var pressed = false
    @State var action: () -> Void

    internal init(
        id: Int = Int.random(in: 1 ..< 100000000),
        text: Binding<String> = .constant("Confirm"),
        icon: Binding<String> = .constant("checkmark.circle"),
        background: Color = Color(.systemBlue),
        disabled: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        self.id = id
        self._text = text
        self._icon = icon
        self.action = action
        self.background = background
        self.disabled = disabled
    }

    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                HStack(alignment: .center, spacing: 4) {
                    if icon != "" {
                        Image(systemName: icon)
                            .font(.system(.body, design: .rounded, weight: .bold))
                            .contrastTextColor(background: background, light: .white, dark: .black)
                            .transition(.opacity)
                            .matchedGeometryEffect(
                                id: "layer.button.icon.\(id)",
                                in: LayerConstants.namespace
                            )
                    }

                    Text(text)
                        .font(.system(.body, design: .rounded, weight: .bold))
                        .contrastTextColor(background: background, light: .white, dark: .black)
                        .transition(.scale(scale: 1.0))
                        .matchedGeometryEffect(
                            id: "layer.button.text.\(id)",
                            in: LayerConstants.namespace
                        )
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(disabled ? background.opacity(0.5) : background.opacity(1.0))
            .clipShape(RoundedRectangle(cornerRadius: 100, style: .continuous))
            .scaleEffect(pressed ? 0.85 : 1)
            .animation(.spring(response: 0.4, dampingFraction: 0.6), value: pressed)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        pressed = true
                    }
                    .onEnded { _ in
                        pressed = false
                        action()
                    }
            )
        }
    }
}
