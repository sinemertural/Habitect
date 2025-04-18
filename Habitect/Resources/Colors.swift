//
//  Colors.swift
//  Habitect
//
//  Created by Sinem Ertural on 14.04.2025.
//

import SwiftUI

extension Color {
    static let primaryColor = Color(hex: "#5E60CE")
    static let secondaryColor = Color(hex: "#A7C4FF")

    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

extension LinearGradient {
    static let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color(hex: "#3A0CA3"), Color(hex: "#4361EE")]),
        startPoint: .top,
        endPoint: .bottom
    )
}
