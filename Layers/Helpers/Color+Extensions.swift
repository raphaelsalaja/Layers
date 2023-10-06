//
//  Color+Extensions.swift
//  Layers
//
//  Created by Raphael Salaja on 06/10/2023.
//

import SwiftUI

private enum Luminance {
    static let red: CGFloat = 0.2126
    static let green: CGFloat = 0.7152
    static let blue: CGFloat = 0.0722
    static let threshold: CGFloat = 0.7
}

extension Color {
    /// Returns a Boolean value indicating whether the color is dark.
    var isDark: Bool {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0

        guard UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: nil)
        else {
            return false
        }

        let luminance =
            Luminance.red * red +
            Luminance.green * green +
            Luminance.blue * blue

        return luminance < Luminance.threshold
    }
}
