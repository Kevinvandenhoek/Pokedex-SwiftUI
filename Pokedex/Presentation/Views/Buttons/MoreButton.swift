//
//  MoreButton.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/01/2023.
//

import Foundation
import SwiftUI

struct MoreButton: View {
    
    let onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            ForEach(0..<3) { _ in
                Circle()
                    .frame(width: 3, height: 3)
                    .foregroundColor(Color.Text.primary)
            }
        }
    }
}

#if DEBUG
struct MoreButton_Previews: PreviewProvider {
    
    static var previews: some View {
        return ZStack {
            MoreButton() { }
        }
        .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: .greatestFiniteMagnitude)
        .background(Color.Background.main)
    }
}
#endif
