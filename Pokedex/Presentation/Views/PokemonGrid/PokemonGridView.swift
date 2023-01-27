//
//  PokemonGridView.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/01/2023.
//

import Foundation
import SwiftUI

struct PokemonGridView: View {
    
    let pokemons: [Pokemon]
    
    var body: some View {
        var _: () = print("drawing body")
        LazyVGrid(
            columns: [
                GridItem(.flexible(), spacing: 16),
                GridItem(.flexible(), spacing: 16),
            ],
            spacing: 16
        ) {
            ForEach(pokemons) { pokemon in
                NavigationLink(destination: PokemonDetailPage(pokemon: pokemon)) {
                    PokemonTile(
                        pokemon: pokemon,
                        onTapMore: { print("did tap more for \(pokemon)") }
                    )
                }
            }
        }
    }
}
