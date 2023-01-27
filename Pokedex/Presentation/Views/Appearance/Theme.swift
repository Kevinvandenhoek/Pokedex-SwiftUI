//
//  Color+Extension.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/01/2023.
//

import Foundation
import SwiftUI

extension Color {
    
    // MARK: Background
    enum Background {
        
        static var main: Color { return Color(
            dark: Color(hex: 0xEDF6FF),
            light: Color(hex: 0xEDF6FF)
        ) }
        
        static var onBackground: Color { return Color(
            dark: Color(hex: 0xFFFFFF),
            light: Color(hex: 0xFFFFFF)
        ) }
        
        static var onBackgroundSecondary: Color { return Color(
            dark: Color(hex: 0xF6F6FF),
            light: Color(hex: 0xF6F6FF)
        ) }
    }
    
    enum Shadow {
        
        static var main: Color { return Color(
            dark: Color(hex: 0x303773),
            light: Color(hex: 0x303773)
        ) }
    }
    
    // MARK: Tint
    enum Tint {
        
        static var primary: Color { return Color(
            dark: Color(hex: 0x5631E8),
            light: Color(hex: 0x5631E8)
        ) }
    }
    
    // MARK: Text
    enum Text {
        
        static var primary: Color { return Color(
            dark: Color(hex: 0x0E0940),
            light: Color(hex: 0x0E0940)
        ) }
        
        static var secondary: Color { return Color(
            dark: Color(hex: 0x625F83),
            light: Color(hex: 0x625F83)
        ) }
        
        static var onTint: Color { return Color(
            dark: Color(hex: 0xFFFFFF),
            light: Color(hex: 0xFFFFFF)
        ) }
    }
}
