//
//  LayerButton.swift
//  Eyedee
//
//  Created by Raphael Salaja on 19/09/2023.
//

import SwiftUI

/// A custom button control with text, an optional icon, and various styling options.
///
/// The `LayerButton` allows you to create buttons with customizable text, icons, and visual appearance.
/// It provides options to specify the button's action, background color, and disabled state.
///
/// Example usage:
/// ```swift
/// struct ContentView: View {
///     var body: some View {
///         LayerButton(text: "Submit", action: {
///             // Perform button action here
///         })
///     }
/// }
/// ```
///
/// - Parameters:
///   - id: The unique identifier for the button, used in animations
///   - text: The text displayed on the button.
///   - action: The closure to execute when the button is tapped.
///   - color: The background color of the button.
///   - icon: The name of the system image to display as an icon (optional).
///   - disabled: A boolean indicating whether the button should be disabled (default is `false`).
///
/// The `LayerButton` supports various styling options, including font size, text alignment,
/// padding, background color, and the option to display an icon alongside the text.
///
struct LayerButton: View {
    enum LayerButtonType {
        case single
        case select
    }
    
    @State var id: String
    @State var text: String
    @State var action: () -> Void
    @State var color: Color
    @State var icon: String
    @State var disabled: Bool
    @State var type: LayerButtonType
    
    @State var selected: Bool = false
    
    internal init(
        id: String = UUID().uuidString,
        text: String = "Button",
        color: Color = Color(.systemBlue),
        icon: String = "",
        disabled: Bool = false,
        type: LayerButtonType = .single,
        action: @escaping () -> Void = {}
    ) {
        self.id = id
        self.text = text
        self.action = action
        self.color = color
        self.icon = icon
        self.disabled = disabled
        self.type = type
    }
    
    func selectOperation() {
        action
        
        withAnimation(.snappy(duration: 0.25)) {
            selected.toggle()
        }
    }
    
    var body: some View {
        if type == .single {
            single
        } else {
            select
        }
    }
    
    var single: some View {
        Button(action: action) {
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Spacer(minLength: 0)
                    
                    if icon != "" {
                        Image(systemName: icon)
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(color.isDark ? Color.white : Color.black)
                    }
                    
                    Text(text)
                        .font(.body)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .transition(.scale(scale: 1.0))
                        .matchedGeometryEffect(
                            id: "layer.button.text.\(id)",
                            in: Constants.Animations.Namespaces.namespace
                        )
                        .foregroundColor(color.isDark ? Color.white : Color.black)
                        
                    Spacer(minLength: 0)
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(disabled ? color.opacity(0.5) : color)
            .clipShape(RoundedRectangle(cornerRadius: 100, style: .continuous))
        }
        .disabled(disabled)
        .buttonStyle(ScaleButtonStyle())
    }
    
    var select: some View {
        Button(action: selectOperation) {
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    if icon != "" {
                        Image(systemName: icon)
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemGray))
                    }
                    
                    HStack {
                        Text(text)
                            .font(.body)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .fontDesign(.rounded)
                            .foregroundColor(Color.black)
                            .transition(.slide)
                            .minimumScaleFactor(0.1)
                        
                        Spacer(minLength: 0)
                    }
                    .matchedGeometryEffect(
                        id: "layer.button.select.\(id)",
                        in: Constants.Animations.Namespaces.namespace
                    )
                    
                    if selected {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title3)
                            .frame(width: 16, height: 16)
                            .fontWeight(.black)
                            .foregroundColor(color)
                            .transition(
                                .asymmetric(
                                    insertion:
                                    .scale(scale: 1.0)
                                        .combined(with: .offset(x: 32)),
                                    removal:
                                    .scale(scale: 1.0)
                                        .combined(with: .offset(x: 48))
                                )
                            )
                            .matchedGeometryEffect(
                                id: "layer.button.select.icon.\(id)",
                                in: Constants.Animations.Namespaces.namespace
                            )
                    }
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(selected ? Color(.systemGray6) : Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        .transition(.scale(scale: 1.0))
        .buttonStyle(.plain)
    }
}

#Preview("Select", traits: .sizeThatFitsLayout) {
    VStack {
        LayerButton(
            icon: "plus",
            type: .select
        )
        LayerButton(
            icon: "plus",
            type: .select
        )
        LayerButton(
            icon: "plus",
            type: .select
        )
        LayerButton(
            icon: "plus",
            type: .select
        )
        LayerButton(
            icon: "plus",
            type: .select
        )
    }.padding()
}

#Preview("Action", traits: .sizeThatFitsLayout) {
    LayerButton().padding()
}
