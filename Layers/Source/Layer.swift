//
//  LayerStack.swift
//  Eyedee
//
//  Created by Raphael Salaja on 29/09/2023.
//

import Foundation
import Observation
import SwiftData
import SwiftUI

// MARK: - Namespace

class NamespaceWrapper: ObservableObject {
    var namespace: Namespace.ID

    init(_ namespace: Namespace.ID) {
        self.namespace = namespace
    }
}

// MARK: - Model

/// A class representing a model for managing layered content.
///
/// This class is responsible for managing the state and behavior of layered content, such as headers, contents,
/// and buttons. It allows navigation between different layers of content and provides methods to access the
/// current header, content, and buttons.
@Observable
class LayerModel {
    /// The current index indicating the active layer.
    var index: Int

    /// The maximum number of layers available.
    let max: Int

    /// A dictionary mapping layer indices to their corresponding header views.
    let headers: [Int: AnyView]

    /// A dictionary mapping layer indices to their corresponding content views.
    let contents: [Int: AnyView]

    /// A dictionary mapping layer indices to an array of button configurations.
    let buttons: [Int: [[String: String]]]

    /// Initializes a new instance of the `LayerModel` class.
    ///
    /// - Parameters:
    ///   - index: The initial index of the active layer.
    ///   - max: The maximum number of layers available.
    ///   - headers: A dictionary of header views mapped to their respective layer indices.
    ///   - contents: A dictionary of content views mapped to their respective layer indices.
    ///   - buttons: A dictionary of button configurations mapped to their respective layer indices.
    internal init(
        index: Int,
        max: Int,
        headers: [Int: AnyView],
        contents: [Int: AnyView],
        buttons: [Int: [[String: String]]]
    ) {
        self.index = index
        self.max = max
        self.headers = headers
        self.contents = contents
        self.buttons = buttons
    }

    /// Moves to the next layer.
    func next() {
        withAnimation(.snappy) {
            index = (index + 1) % max
        }
    }

    /// Moves to the previous layer.
    func previous() {
        withAnimation(.snappy) {
            if index == 0 {
                index = max - 1
            } else {
                index = (index - 1) % max
            }
        }
    }

    /// Sets the active layer to the specified index.
    ///
    /// - Parameter index: The index of the layer to set as active.
    func set(index: Int) {
        withAnimation(.snappy) {
            self.index = index
        }
    }

    /// Retrieves the current header view for the active layer.
    ///
    /// - Returns: The current header view or an empty view if none is available.
    func getCurrentHeader() -> AnyView {
        return headers[index] ?? AnyView(EmptyView())
    }

    /// Retrieves the current content view for the active layer.
    ///
    /// - Returns: The current content view or an empty view if none is available.
    func getCurrentContent() -> AnyView {
        return contents[index] ?? AnyView(EmptyView())
    }

    /// Retrieves the button configurations for the active layer.
    ///
    /// - Returns: An array of button configurations for the active layer or an empty array if none is available.
    func getCurrentButtons() -> [[String: String]] {
        return buttons[index] ?? [["": ""]]
    }
}

// MARK: - View

/// A view representing a layered content container.
///
/// The `Layer` struct is used to create a layered content container. It allows you to wrap any content in a
/// visually distinct layer with customizable padding and background styling.
struct Layer: View {
    /// The namespace used for matched geometry effects within this layer.
    @Namespace private var namespace

    /// The content to be displayed within the layer.
    let content: AnyView

    /// Initializes a new instance of the `Layer` struct.
    ///
    /// - Parameters:
    ///   - content: A closure that generates the content to be displayed within the layer.
    init<Content>(
        @ViewBuilder content: @escaping () -> Content
    ) where Content: View {
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
                    Color(.systemBackground)
                        .matchedGeometryEffect(
                            id: "layer.background",
                            in: namespace
                        )
                )
                .mask {
                    RoundedRectangle(cornerRadius: 32, style: .continuous)
                        .matchedGeometryEffect(
                            id: "layer.mask",
                            in: namespace
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
        .environmentObject(NamespaceWrapper(namespace))
    }
}
