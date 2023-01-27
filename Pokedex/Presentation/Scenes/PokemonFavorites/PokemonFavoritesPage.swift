//
//  PokemonFavoritesPage.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/01/2023.
//

import Foundation
import SwiftUI
import Factory

struct PokemonFavoritesPage: View {
    
    @StateObject
    var favoritesRepository = Container.favoritesRepository()
    
    @StateObject
    var pokemonRepository = Container.pokemonRepository()
    
    var body: some View {
        ScrollablePage {
            TryView {
                if let pokemons = try pokemonRepository.pokemons?.get(),
                   let favorites = try favoritesRepository.ids?.get() {
                    let pokemons = pokemons.filtered(by: favorites)
                    PokemonGridView(pokemons: pokemons)
                        .ifEmpty { Text("Add some favorites").style(.header) }
                } else {
                    ProgressView()
                }
            }
        }
    }
}

// MARK: View helpers
extension PokemonFavoritesPage {
    
    
}

#if DEBUG
struct PokemonFavoritesPage_Previews: PreviewProvider {
    
    static var previews: some View {
        PokemonFavoritesPage()
    }
}
#endif
