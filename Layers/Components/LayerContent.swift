//
//  LayerContent.swift
//  Eyedee
//
//  Created by Raphael Salaja on 29/09/2023.
//

import SwiftUI

struct LayerContent: View {
    @State var content: AnyView

    init() {
        self.content = AnyView(EmptyView())
    }

    internal init<Content>(@ViewBuilder content: @escaping () -> Content) where Content: View {
        self.content = AnyView(content())
    }

    var body: some View {
        content
    }
}
