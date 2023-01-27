//
//  View+Extension.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/01/2023.
//

import Foundation
import SwiftUI

extension View {
    
    func fillAvailableSpace() -> some View {
        self.frame(maxWidth: .greatestFiniteMagnitude, maxHeight: .greatestFiniteMagnitude)
    }
    
    func withPagePadding() -> some View {
        self
            .padding(.vertical, 24)
            .padding(.horizontal, 24)
    }
    
    func withShadow() -> some View {
        self
            .shadow(color: Color.Shadow.main.opacity(0.15), radius: 7.5, y: 2)
    }
}
