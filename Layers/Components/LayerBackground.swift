//
//  LayerBackground.swift
//  Eyedee
//
//  Created by Raphael Salaja on 29/09/2023.
//

import SwiftUI

struct LayerBackground: View {
    @State private var z: Double = 0
    @State private var opacity: Double
    @State private var color: Color

    internal init(z: Double = 0,
                  opacity: Double = 0.25,
                  color: Color = .black)
    {
        self.z = z
        self.opacity = opacity
        self.color = color
    }

    var body: some View {
        ZStack {
            Color(color.opacity(opacity)).ignoresSafeArea()
        }.zIndex(z)
    }
}
