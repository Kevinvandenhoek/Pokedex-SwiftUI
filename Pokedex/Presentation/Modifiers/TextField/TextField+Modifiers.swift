//
//  TextField.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/01/2023.
//

import Foundation
import SwiftUI

// MARK: Modifiers
extension TextField {
    
    func withStyle(_ style: TextFieldStyle, color: Color = Color.Text.primary) -> some View {
        modifier(style)
            .foregroundColor(color)
    }
    
    func withSearchBarStyle() -> some View {
        HStack(spacing: 15) {
            Image("icon_search")
            self
                .withStyle(.search)
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 19)
        .background(Color.Background.onBackground)
        .cornerRadius(8)
        .withShadow()
    }
}

// MARK: TextStyle
enum TextFieldStyle: ViewModifier {
    
    case search
    
    func body(content: Content) -> some View {
        content
            .fontWeight(weight)
            .font(Font.inter(size))
    }
}

// MARK: Helpers
private extension TextFieldStyle {
    
    var size: CGFloat {
        switch self {
        case .search:
            return 16        }
    }
    
    var weight: Font.Weight {
        switch self {
        case .search:
            return .regular
        }
    }
}
