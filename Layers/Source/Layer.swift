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

// MARK: - Constants

public enum LayerConstants {
    static let namespace: Namespace.ID = Namespace().wrappedValue
}

// MARK: - Model

@Observable
class LayerModel {
    var index: Int
    var max: Int
    var headers: [Int: AnyView]
    var contents: [Int: AnyView]
    var buttons: [Int: [[String: String]]]

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

    func next() {
        withAnimation(.snappy) {
            index = (index + 1) % max
        }
    }

    func previous() {
        withAnimation(.snappy) {
            if index == 0 {
                index = max - 1
            } else {
                index = (index - 1) % max
            }
        }
    }

    func set(index: Int) {
        withAnimation(.snappy) {
            self.index = index
        }
    }

    func getCurrentHeader() -> AnyView {
        return headers[index] ?? AnyView(EmptyView())
    }

    func getCurrentContent() -> AnyView {
        return contents[index] ?? AnyView(EmptyView())
    }

    func getCurrentButtons() -> [[String: String]] {
        return buttons[index] ?? [["": ""]]
    }
}

// MARK: - View

struct Layer: View {
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
                    Color(.systemBackground)
                        .matchedGeometryEffect(
                            id: "layer.background",
                            in: LayerConstants.namespace
                        )
                )
                .mask {
                    RoundedRectangle(cornerRadius: 32, style: .continuous)
                        .matchedGeometryEffect(
                            id: "layer.mask",
                            in: LayerConstants.namespace
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
