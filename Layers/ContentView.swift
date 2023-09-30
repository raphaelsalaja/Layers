//
//  ContentView.swift
//  Layers
//
//  Created by Raphael Salaja on 30/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        @Namespace private var namespace
        
        @State var index = 0
        
        let headers: [String] = [
            "Heading 1",
            "Heading 2",
            "Heading 3",
            "Heading 4"
        ]
        
        let descriptions: [String] = [
            """
            Ad elit do deserunt elit Lorem consectetur ipsum cillum labore id.
            """,
            """
            Consequat cillum amet sint elit ut ut exercitation.
            """,
            """
            Excepteur nostrud anim mollit magna sunt aliqua aliqua do esse.
            """,
            """
            Eu laborum consequat laboris eiusmod dolor.
            """
        ]
        
        let contents: [LayerContent] = [
            LayerContent(),
            LayerContent(),
            LayerContent {
                LayerImagePicker()
            },
            LayerContent()
        ]
        
        var body: some View {
            LayerStack {
                HStack {
                    LayerTitle(title: headers[index]).id(headers[index])
                    
                    LayerIcon(icon: "xmark")
                }
                
                LayerDescription(description: descriptions[index]).id(descriptions[index])
                
                ForEach(contents.indices) { position in
                    if position == self.index {
                        self.contents[index]
                            .matchedGeometryEffect(
                                id: LayerConstants.Animations.Namespaces.content + String(index),
                                in: namespace
                            )
                            .transition(
                                .asymmetric(
                                    insertion:
                                    .opacity.combined(with: .scale(scale: 0.9)),
                                    
                                    removal:
                                    .opacity.combined(with: .scale(scale: 1.0))
                                )
                            )
                    }
                }
                
                LayerActions {
                    LayerButton(
                        id: "cancel",
                        text: "Cancel",
                        color: Color(.systemOrange)
                    )
                    
                    LayerButton(
                        id: "continue",
                        text: "Continue",
                        color: Color(.systemBlue)
                    ) {
                        withAnimation(.snappy) {
                            index = (index + 1) % 4
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LayerBackground {
        ContentView()
    }
}
