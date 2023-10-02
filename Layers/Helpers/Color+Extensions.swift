//
//  Color+Extensions.swift
//  Layers
//
//  Created by Raphael Salaja on 02/10/2023.
//

import SwiftUI

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
            Constants.Luminance.red * red +
            Constants.Luminance.green * green +
            Constants.Luminance.blue * blue

        return luminance < Constants.Luminance.threshold
    }
}
