//
//  LayerExample.swift
//  Eyedee
//
//  Created by Raphael Salaja on 21/09/2023.
//

import SwiftUI

struct Layer_Example: View {
    @Environment(\.colorScheme) var colorScheme

    enum Layers {
        case start
        case middle
        case select
        case end
    }
        
    @State var opacity: CGFloat = 0.0
    @State var layer: Layers = .start
    @State var index: Int = 0
        
    @Namespace private var _default
        
    var titles: [String] = [
        "Heading 1",
        "Heading 2",
        "Heading 3",
        "Heading 4"
    ]
        
    var texts: [String] = [
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
        
    @State var text: String = "Ad elit do deserunt elit Lorem consectetur ipsum cillum labore id."
    @State var title: String = "Heading 1"
        
    var padding: EdgeInsets = .init(
        top: 0,
        leading: 16,
        bottom: 0,
        trailing: 16
    )
        
    func change() {
        withAnimation(.snappy) {
            index += 1
                
            if index > 3 {
                index = 0
            }
                
            updateLayers(index: index)
                
            title = titles[index]
            text = texts[index]
        }
    }
        
    func updateLayers(index: Int) {
        self.index = index
        
        print(index)
        
        switch index {
        case 0:
            layer = .start
        case 1:
            layer = .middle
        case 2:
            layer = .select
        case 3:
            layer = .end
        default:
            layer = .start
        }
    }

    init() {
        title = titles[index]
        text = texts[index]
    }

    var body: some View {
        VStack {
            Spacer()
            /*
             ZStack {
                 VStack(alignment: .leading, spacing: 24) {
                     HStack {
                         LayerTitle(title: title)
                             .id(title)
                             .matchedGeometryEffect(
                                 id: "layer.title",
                                 in: _default
                             )
                             .transition(
                                 .asymmetric(
                                     insertion:
                                     .opacity.combined(with: .scale(scale: 1.0)),
                                    
                                     removal:
                                     .opacity.combined(with: .scale(scale: 1.0))
                                 )
                             )
                        
                         Spacer()
                        
                         LayerIcon(icon: "xmark")
                     }
                    
                     LayerDescription(description: text)
                         .id(text)
                         .matchedGeometryEffect(
                             id: "layer.text",
                             in: _default
                         )
                         .transition(
                             .asymmetric(
                                 insertion:
                                 .opacity.combined(with: .scale(scale: 0.9)),
                                
                                 removal:
                                 .opacity.combined(with: .scale(scale: 1.0))
                             )
                         )
                    
                     if layer == .middle {
                         // LayerImagePicker(namespace: _default)
                     }
                    
                     if layer == .select {
                         VStack(spacing: 8) {
                             LayerButton(
                                 color: Color(.green),
                                 icon: "plus",
                                 namespace: _default,
                                 type: .select
                             )
                            
                             LayerButton(
                                 color: Color(.green),
                                 icon: "plus",
                                 namespace: _default,
                                 type: .select
                             )
                            
                             LayerButton(
                                 color: Color(.green),
                                 icon: "plus",
                                 namespace: _default,
                                 type: .select
                             )
                            
                             LayerButton(
                                 color: Color(.green),
                                 icon: "plus",
                                 namespace: _default,
                                 type: .select
                             )
                         }
                         .transition(
                             .asymmetric(
                                 insertion:
                                 .opacity.animation(.default.delay(0.30))
                                     .combined(
                                         with: .scale(scale: 0.9).animation(.default.delay(0.30))),
                                 removal: .opacity
                             )
                         )
                     }
                    
                     if layer == .end {
                         LayerTextField(
                             input: "",
                             placeholder: "Placeholder",
                             variation: .small
                         )
                         .matchedGeometryEffect(
                             id: "layer.textfield",
                             in: _default
                         )
                         .transition(
                             .opacity.combined(with: .scale(scale: 1.00))
                         )
                     }
                     HStack {
                         switch layer {
                         case .start:
                             LayerButton(
                                 id: "cancel",
                                 text: "Cancel",
                                 action: change,
                                 color: Color(.systemGray6),
                                 namespace: _default
                             )
                            
                             LayerButton(
                                 id: "continue",
                                 text: "Continue",
                                 action: change,
                                 color: Color(.green),
                                 namespace: _default
                             )
                            
                         case .middle:
                             LayerButton(
                                 id: "cancel",
                                 text: "Cancel",
                                 action: change,
                                 color: Color(.systemGray6),
                                 namespace: _default
                             )
                            
                             LayerButton(
                                 id: "continue",
                                 text: "Continue",
                                 action: change,
                                 color: Color(.green),
                                 namespace: _default
                             )
                            
                         case .select:
                             LayerButton(
                                 id: "cancel",
                                 text: "Cancel",
                                 action: change,
                                 color: Color(.systemGray6),
                                 namespace: _default
                             )
                            
                             LayerButton(
                                 id: "continue",
                                 text: "Continue",
                                 action: change,
                                 color: Color(.green),
                                 namespace: _default
                             )
                         case .end:
                             LayerButton(
                                 id: "cancel",
                                 text: "Cancel",
                                 action: change,
                                 color: Color(.systemGray6),
                                 namespace: _default
                             )
                         }
                     }
                 }
                 .padding(32)
                 .background(
                     Color(.layerBackground)
                         .matchedGeometryEffect(
                             id: "layer.container",
                             in: _default
                         )
                 )
                 .mask {
                     RoundedRectangle(cornerRadius: 32, style: .continuous)
                         .matchedGeometryEffect(
                             id: "layer.mask",
                             in: _default
                         )
                 }
             }
              */
        }
        .padding(padding)
    }
}
     
#Preview("Example") {
    ZStack {
        Color(.black.opacity(0.25)).ignoresSafeArea()
        Layer_Example()
    }
}
