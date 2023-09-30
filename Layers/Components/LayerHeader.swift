//
//  LayerHeader.swift
//  Eyedee
//
//  Created by Raphael Salaja on 29/09/2023.
//

import SwiftUI

struct LayerHeader: View {
    @State var content: AnyView

    public init<Content>(@ViewBuilder content: @escaping () -> Content) where Content: View {
        self.content = AnyView(content())
    }

    var body: some View {
        HStack {
            content
        }
    }
}

#Preview {
    LayerHeader {
        Text("Hello, World!")
    }
}
