//
//  Layer+Helpers.swift
//  Layers
//
//  Created by Raphael Salaja on 01/10/2023.
//

import SwiftUI

struct FullWidthText: View {
    @State var text: AnyView
    @State var center: Bool

    public init<Content>(
        center: Bool = false,
        @ViewBuilder text: @escaping () -> Content) where Content: View
    {
        self.center = center
        self.text = AnyView(text())
    }

    var body: some View {
        HStack {
            if center {
                Spacer()
            }

            text

            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
