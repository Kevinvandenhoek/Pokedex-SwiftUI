//
//  AsyncImage+Extension.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/01/2023.
//

import Foundation
import SwiftUI

extension AsyncImage {
    
    init(_ url: URL, contentMode: ContentMode) where Content == _ConditionalContent<AnyView, Color> {
        self.init(
            url: url,
            content: { image in
                AnyView(image
                    .interpolation(.none)
                    .resizable()
                    .aspectRatio(contentMode: contentMode))
            },
            placeholder: {
                Color.Background.onBackgroundSecondary
            }
        )
    }
}
