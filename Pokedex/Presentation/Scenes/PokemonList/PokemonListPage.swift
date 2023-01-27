//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 30/12/2022.
//

import Foundation
import SwiftUI
import Factory

struct PokemonListPage: View {
    
    @StateObject
    var pokemonRepository = Container.pokemonRepository()
    
    @State
    var searchTerm: String = ""
    
    var body: some View {
        ScrollablePage {
            if let pokemons = pokemonRepository.pokemons {
                switch pokemons {
                case .success(let pokemons):
                    grid(with: pokemons.filtered(by: searchTerm))
                case .failure(let error):
                    Text("Error: \(error.localizedDescription)")
                }
            } else {
                grid(with: .redacted)
                    .redacted(reason: .placeholder)
            }
        }
    }
}

private extension PokemonListPage {
    
    @ViewBuilder
    func grid(with pokemons: [Pokemon]) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            TextField(.pokemonListSearchFieldPlaceholder, text: $searchTerm)
                .withSearchBarStyle()
                .padding(.bottom, 32)
            Text(LocalizedStringKey.pokemonListTitle)
                .style(.title)
                .padding(.bottom, 16)
            PokemonGridView(pokemons: pokemons)
                .ifEmpty {
                    Text(searchTerm.isEmpty ? "Backend is a lying cunt" : "No search results")
                        .style(.body)
                }
        }
    }
}

#if DEBUG
struct PokemonListPage_Previews: PreviewProvider {
    
    static var previews: some View {
        PokemonListPage()
    }
}
#endif
