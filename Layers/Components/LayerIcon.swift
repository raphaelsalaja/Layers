//
//  LayerIcon.swift
//  Eyedee
//
//  Created by Raphael Salaja on 19/09/2023.
//

import SwiftUI

enum IconStyle {
    case native
    case button
}

struct LayerIcon: View {
    @State public var icon: String

    @State public var action: (() -> Void)?

    internal init(icon: String, action: (() -> Void)? = nil) {
        self.icon = icon
        self.action = action
    }

    var body: some View {
        Button(action: {}) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .fontWeight(.black)
                .fontDesign(.rounded)
                .scaleEffect(0.416)
                .foregroundColor(Color(.systemGray))
                .background(Color(.systemGray6))
                .clipShape(Circle())
        }
    }
}

#Preview {
    LayerIcon(icon: "xmark")
}
