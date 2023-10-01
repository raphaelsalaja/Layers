//
//  ContentView.swift
//  Layers
//
//  Created by Raphael Salaja on 30/09/2023.
//

import ConfettiSwiftUI
import SwiftUI

struct ContentView: View {
    @State var show: Bool

    @State var counter: Int = 0

    init() {
        show = false
    }

    var body: some View {
        NavigationStack {
            ZStack {
                if show {
                    LayerBackground()
                        .zIndex(2)

                    Layer_Example()
                        .zIndex(3)
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .bottom),
                                removal: .move(edge: .bottom)
                            )
                        )
                }
            }
        }
        .onTapGesture {
            if show {
                withAnimation(.snappy(duration: 1)) {
                    show.toggle()
                }
            }
            else {
                withAnimation(.snappy) {
                    show.toggle()
                }
            }
        }y
    }
}

#Preview {
    ContentView()
}
