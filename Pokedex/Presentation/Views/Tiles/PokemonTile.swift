//
//  PokemonTile.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/01/2023.
//

import Foundation
import SwiftUI

struct PokemonTile: View {
    
    let pokemon: Pokemon
    let onTapMore: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topLeading) {
                AsyncImage(
                    url: pokemon.image,
                    content: { image in
                        image
                            .interpolation(.none)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                    },
                    placeholder: { Color.Background.onBackgroundSecondary }
                )
                Text(String(format: "%03d", pokemon.id))
                    .tagStyle()
            }
            .background(Color.Background.onBackgroundSecondary)
            .aspectRatio(1, contentMode: .fit)
            HStack(alignment: .center) {
                Text(pokemon.name)
                    .style(.header)
                    .padding(.leading, 12)
                Spacer()
                MoreButton(onTap: onTapMore)
                    .frame(width: 32)
            }
            .padding(.vertical, 14.5)
        }
        .background(Color.Background.onBackground)
        .cornerRadius(8)
        .withShadow()
    }
}

#if DEBUG
struct PokemonTile_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            PokemonTile(pokemon: .stubbed(), onTapMore: { })
                .frame(width: 150)
        }
        .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: .greatestFiniteMagnitude)
        .background(Color.Background.main)
    }
}
#endif
