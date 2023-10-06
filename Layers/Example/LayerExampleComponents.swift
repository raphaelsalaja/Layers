//
//  LayerExampleComponents.swift
//  Layers
//
//  Created by Raphael Salaja on 06/10/2023.
//

import MapKit
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
            .padding(20)
            .font(.system(.body, design: .rounded, weight: .bold))
            .multilineTextAlignment(.leading)
            .foregroundStyle(.secondary)
            .background(Color(.tertiarySystemFill))
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
    @EnvironmentObject var namespaceWrapper: NamespaceWrapper

    var body: some View {
        HStack {
            ExampleIcon(icon: "questionmark")
                .matchedGeometryEffect(
                    id: "layer.icon.left",
                    in: namespaceWrapper.namespace
                )

            FullWidthText(center: true) {
                Text("Share Post")
                    .fixedSize()
                    .font(.system(.title3, design: .rounded, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .transition(.scale(scale: 1.0))
                    .matchedGeometryEffect(
                        id: "layer.header",
                        in: namespaceWrapper.namespace
                    )
            }

            ExampleIcon(icon: "xmark")
                .matchedGeometryEffect(
                    id: "layer.icon.right",
                    in: namespaceWrapper.namespace
                )
        }
    }
}

struct ExampleHeader2: View {
    @EnvironmentObject var namespaceWrapper: NamespaceWrapper

    var body: some View {
        HStack {
            FullWidthText {
                Text("Attach Message")
                    .fixedSize()
                    .font(.system(.title3, design: .rounded, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .transition(.scale(scale: 1.0))
                    .matchedGeometryEffect(
                        id: "layer.header",
                        in: namespaceWrapper.namespace
                    )
            }

            ExampleIcon(icon: "xmark")
                .matchedGeometryEffect(
                    id: "layer.icon.right",
                    in: namespaceWrapper.namespace
                )
        }
    }
}

struct ExampleHeader3: View {
    @EnvironmentObject var namespaceWrapper: NamespaceWrapper

    var body: some View {
        HStack {
            ExampleIcon(icon: "questionmark")
                .matchedGeometryEffect(
                    id: "layer.icon.left",
                    in: namespaceWrapper.namespace
                )

            FullWidthText(center: true) {
                Text("Confirm Post")
                    .fixedSize()
                    .font(.system(.title3, design: .rounded, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .transition(.scale(scale: 1.0))
                    .matchedGeometryEffect(
                        id: "layer.header",
                        in: namespaceWrapper.namespace
                    )
            }

            ExampleIcon(icon: "xmark")
                .matchedGeometryEffect(
                    id: "layer.icon.right",
                    in: namespaceWrapper.namespace
                )
        }
    }
}

// MARK: - Example Content

struct ExampleContent1: View {
    @EnvironmentObject var namespaceWrapper: NamespaceWrapper

    var body: some View {
        VStack(spacing: 16) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Name")
                        .font(.system(.footnote, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.secondary)

                    Text("Smart Reaction")
                        .font(.system(.callout, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.primary)
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Text("Format")
                        .font(.system(.footnote, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.secondary)

                    Text("JPEG")
                        .font(.system(.callout, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.primary)
                }
            }
            .padding()
            .frame(maxWidth: 300)
            .background(Color(.tertiarySystemFill))
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .matchedGeometryEffect(
                id: "layer.content.image.details",
                in: namespaceWrapper.namespace
            )

            Image(.smart)
                .resizable()
                .frame(maxWidth: 300, maxHeight: 300)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .transition(.scale(scale: 1.0))
                .matchedGeometryEffect(
                    id: "layer.content.image",
                    in: namespaceWrapper.namespace
                )

            HStack(alignment: .top) {
                HStack {
                    Image(systemName: "paperplane")
                        .font(.system(.callout, design: .rounded, weight: .bold))
                        .foregroundColor(Color(.systemGray))

                    Text("Recipient")
                        .font(.system(.callout, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Text("@raphaelsalaja")
                    .font(.system(.callout, design: .rounded, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.primary)
            }
            .padding()
            .frame(maxWidth: 300)
            .background(Color(.tertiarySystemFill))
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .matchedGeometryEffect(
                id: "layer.content.recipient",
                in: namespaceWrapper.namespace
            )
        }
    }
}

struct ExampleContent2: View {
    @EnvironmentObject var namespaceWrapper: NamespaceWrapper

    var body: some View {
        VStack(spacing: 16) {
            ExampleTextField(input: "", placeholder: "Something meaningful...", variation: .extraLarge)
                .matchedGeometryEffect(
                    id: "layer.content.texfield",
                    in: namespaceWrapper.namespace
                )
        }
    }
}

struct ExampleContent3: View {
    @EnvironmentObject var namespaceWrapper: NamespaceWrapper

    var body: some View {
        VStack(spacing: 16) {
            HStack(alignment: .top) {
                HStack {
                    Image(systemName: "paperplane")
                        .font(.system(.callout, design: .rounded, weight: .bold))
                        .foregroundColor(Color(.systemGray))

                    Text("Recipient")
                        .font(.system(.callout, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Text("@raphaelsalaja")
                    .font(.system(.callout, design: .rounded, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.primary)
            }

            Divider()

            HStack {
                VStack(alignment: .leading) {
                    Text("Name")
                        .font(.system(.footnote, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.secondary)

                    Text("Smart Reaction")
                        .font(.system(.callout, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.primary)
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Text("Format")
                        .font(.system(.footnote, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.secondary)

                    Text("JPEG")
                        .font(.system(.callout, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.primary)
                }
            }

            Divider()

            VStack(alignment: .leading) {
                FullWidthText {
                    Text("Message")
                        .font(.system(.footnote, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.secondary)
                }

                FullWidthText {
                    Text("Sending this with lots of love, tell your friends I said hi.")
                        .font(.system(.callout, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.primary)
                }
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color(.tertiarySystemFill))
        .foregroundStyle(.black)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .matchedGeometryEffect(
            id: "layer.content.final",
            in: namespaceWrapper.namespace
        )
    }
}

#Preview {
    VStack {
        ExampleContent1()
        ExampleContent2()
        ExampleContent3()
    }
}

// MARK: - Example Buttons

struct LayerButton: View {
    @EnvironmentObject var namespaceWrapper: NamespaceWrapper

    @Binding var text: String
    @Binding var icon: String

    @State var id: Int
    @State var background: Color
    @State var disabled: Bool
    @State var foregroundColor: Color? = nil
    @State var pressed = false
    @State var action: () -> Void

    internal init(
        id: Int = Int.random(in: 1 ..< 100000000),
        text: Binding<String> = .constant("Confirm"),
        icon: Binding<String> = .constant("checkmark.circle"),
        background: Color = Color(.systemBlue),
        foregroundColor: Color? = nil,
        disabled: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        self.id = id
        self._text = text
        self._icon = icon
        self.action = action
        self.background = background
        self.foregroundColor = foregroundColor
        self.disabled = disabled
    }

    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                HStack(alignment: .center, spacing: 4) {
                    if icon != "" {
                        Image(systemName: icon)
                            .font(.system(.body, design: .rounded, weight: .bold))
                            .contrastTextColor(background: background, foregroundColor: foregroundColor)
                            .transition(.opacity)
                            .matchedGeometryEffect(
                                id: "layer.button.icon.\(id)",
                                in: namespaceWrapper.namespace
                            )
                    }

                    Text(text)
                        .contrastTextColor(background: background, foregroundColor: foregroundColor)
                        .font(.system(.body, design: .rounded, weight: .bold))
                        .transition(.scale(scale: 1.0))
                        .matchedGeometryEffect(
                            id: "layer.button.text.\(id)",
                            in: namespaceWrapper.namespace
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
