//
//  LayerModel.swift
//  Layers
//
//  Created by Raphael Salaja on 06/10/2023.
//

import Foundation
import Observation
import SwiftData
import SwiftUI

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
        withAnimation(.bouncy) {
            index = (index + 1) % max
        }
    }

    func previous() {
        withAnimation(.bouncy) {
            if index == 0 {
                index = max - 1
            } else {
                index = (index - 1) % max
            }
        }
    }

    func set(index: Int) {
        withAnimation(.bouncy) {
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
