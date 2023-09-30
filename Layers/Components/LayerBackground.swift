//
//  LayerBackground.swift
//  Eyedee
//
//  Created by Raphael Salaja on 29/09/2023.
//

import SwiftUI

struct LayerBackground: View {
    @State var content: AnyView

    public init<Content>(@ViewBuilder content: @escaping () -> Content) where Content: View {
        self.content = AnyView(content())
    }

    var body: some View {
        ZStack {
            Color(.black.opacity(0.25)).ignoresSafeArea()

            content
        }
    }
}

#Preview {
    LayerBackground {
        LayerPlayground()
    }
}
