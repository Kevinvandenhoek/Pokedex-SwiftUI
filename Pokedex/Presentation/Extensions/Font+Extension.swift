//
//  Font+Extension.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/01/2023.
//

import Foundation
import SwiftUI

extension Font {
    
    static func rubik(_ size: CGFloat) -> Font {
        Font.custom("Rubik", size: size)
    }
    
    static func inter(_ size: CGFloat) -> Font {
        Font.custom("Inter", size: size)
    }
}
