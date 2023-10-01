//
//  Layer.swift
//  Eyedee
//
//  Created by Raphael Salaja on 19/09/2023.
//

import FluidGradient
import PhotosUI
import SwiftUI

struct LayerImagePicker: View {
//    @State var namespace: Namespace.ID

    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                FluidGradient(blobs: [.red, .green, .blue],
                              highlights: [.yellow, .orange, .purple],
                              speed: 1.0,
                              blur: 0.75)
                    .background(.quaternary)
                    .overlay(
                        Image(systemName: "party.popper.fill")
                            .font(.system(size: 50))
                            .foregroundColor(Color(.white))
                    )
//
//                Text("Tap to add an image")
//                    .font(.headline)
//                    .fontWeight(.bold)
//                    .multilineTextAlignment(.center)
//                    .fontDesign(.rounded)
//                    .foregroundColor(Color(.systemGray))
            }
        }
        .frame(maxHeight: 300)
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .shadow(color: Color(.systemGray4), radius: 10, x: 0, y: 5)
//        .matchedGeometryEffect(
//            id: "layer.image.picker",
//            in: namespace
//        )
//        .transition(
//            .asymmetric(
//                insertion:
//                .opacity.animation(.default.delay(0.30))
//                    .combined(
//                        with: .scale(scale: 0.9).animation(.default.delay(0.30))),
//                removal: .opacity
//            )
//        )
    }
}

struct LayerImage: View {
//    @State var namespace: Namespace.ID

    var body: some View {
        VStack(alignment: .center) {
            Image(.image)
                .resizable()
                .scaledToFill()
                .cornerRadius(20, antialiased: true)
                .contentShape(Rectangle())
                .clipped()
        }
        .frame(maxHeight: 300)
        .frame(maxWidth: 300)
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .shadow(color: Color(.systemGray4), radius: 10, x: 0, y: 5)
    }
}

#Preview("Image Picker") {
    LayerImage()
}
