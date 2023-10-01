//
//  LayerBackground.swift
//  Eyedee
//
//  Created by Raphael Salaja on 29/09/2023.
//

import SwiftUI

struct LayerBackground: View {
    var body: some View {
        ZStack {
            Color(.black.opacity(0.25))
                .ignoresSafeArea()
        }
    }
}
