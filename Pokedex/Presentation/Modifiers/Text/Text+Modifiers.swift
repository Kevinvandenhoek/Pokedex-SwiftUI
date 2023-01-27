//
//  Text+Style.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/01/2023.
//

import Foundation
import SwiftUI

// MARK: Modifiers
extension Text {
    
    func style(_ style: TextStyle, color: Color = Color.Text.primary) -> some View {
        modifier(style)
            .foregroundColor(color)
    }
    
    func tagStyle() -> some View {
        self
            .style(.subtext, color: Color.Text.onTint)
            .padding(.vertical, 4)
            .padding(.horizontal, 6)
            .background(Color.Tint.primary)
            .cornerRadius(4)
            .padding(.all, 8)
    }
}

// MARK: TextStyle
enum TextStyle: ViewModifier {
    
    case title
    case header
    case body
    case bodyBold
    case subtext
    
    func body(content: Content) -> some View {
        content
            .fontWeight(weight)
            .font(Font.rubik(size))
    }
}

// MARK: Helpers
private extension TextStyle {
    
    var size: CGFloat {
        switch self {
        case .title:
            return 24
        case .header:
            return 16
        case .body, .bodyBold:
            return 14
        case .subtext:
            return 10
        }
    }
    
    var weight: Font.Weight {
        switch self {
        case .title:
            return .bold
        case .header, .bodyBold:
            return .medium
        case .body:
            return .regular
        case .subtext:
            return .medium
        }
    }
}
