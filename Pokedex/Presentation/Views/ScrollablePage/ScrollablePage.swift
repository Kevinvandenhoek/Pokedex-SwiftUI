//
//  ScrollablePage.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/01/2023.
//

import Foundation
import SwiftUI

struct ScrollablePage<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ScrollView {
            content
                .withPagePadding()
        }
        .fillAvailableSpace()
        .background(Color.Background.main)
    }
}
