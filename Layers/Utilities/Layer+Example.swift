//
//  LayerExample.swift
//  Eyedee
//
//  Created by Raphael Salaja on 21/09/2023.
//

import SwiftUI

struct Layer_Example: View {
    @Namespace private var namespace
    
    @State var index = 0
    
    let headers: [String] = [
        "Announcing Layers",
        "One Issue",
        "What's Next?",
        "Thanks for reading!"
    ]
    
    let descriptions: [String] = [
        """
        Layers is a SwiftUI library for creating layered user interfaces.
        
        It's a simple and easy to use solution for creating smooth and performant animations between modal views.
        """,
        """
        Layers as it stands is not a perfect solution, but it's a start.
        
        Which is why I'm releasing it as an open source project, for the community to build upon.
        """,
        """
        If you'd like to contribute to Layers, please check out the GitHub repository below.
        """,
        """
        Give it a star if you like it, and feel free to open an issue if you have any suggestions.
        """
    ]
    
    let contents: [LayerContent] = [
        LayerContent {
            LayerImagePicker()
        },
        LayerContent(),
        LayerContent {
            LayerImage()
        },
        LayerContent()
    ]
    
    let actions: [[String]] = [
        ["Nice!"],
        ["Can I help?"],
        ["Help & Support"],
        ["Take me there!"]
    ]
    
    @State var action: String
    @State var show: Bool
    
    init() {
        action = actions[0][0]
        show = true
    }
  
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
                            id: Constants.Animations.Namespaces.content + String(index),
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
            if index == 3 {
                LayerButton(
                    text: $action,
                    color: Color(.systemBlue),
                    icon: "photo"
                ) {
                    withAnimation(.smooth) {
                        index = (index + 1) % 4
                        action = actions[index][0]
                    }
                }
            }
            else {
                LayerButton(
                    text: $action,
                    color: Color(.systemBlue),
                    icon: ""
                ) {
                    withAnimation(.smooth) {
                        index = (index + 1) % 4
                        action = actions[index][0]
                    }
                }
            }
        }
    }
}
