//
//  PokemonDetailPage.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 19/01/2023.
//  
//

import Foundation
import SwiftUI
import Factory

struct PokemonDetailPage: View {
    
    let pokemon: Pokemon
    
    @StateObject
    var detailRepository: PokemonDetailRepository
    
    @StateObject
    var favoritesRepository: FavoritesRepository = Container.favoritesRepository()
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        self._detailRepository = StateObject(wrappedValue: Container.detailRepository(pokemon.id))
    }
    
    var body: some View {
        VStack {
            AsyncImage(pokemon.image, contentMode: .fit)
            switch detailRepository.detail {
            case .success(let detail):
                Text(detail.name)
                ForEach(detail.moves, id: \.self) { move in
                    Text(move.name)
                }
            case .failure(let error):
                Text("Error: \(error.localizedDescription)")
            case .none:
                ProgressView()
            }
        }
        .navigationTitle(pokemon.name)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarTrailing) {
//                Button(action: didTapFavorite) { favoriteLabel }
//            }
//        }
    }
}

// MARK: Actions
extension PokemonDetailPage {
    
    func didTapFavorite() {
        favoritesRepository.toggleFavorite(for: pokemon.id)
    }
}

#if DEBUG
struct PokemonDetailPage_Previews: PreviewProvider {
    
    static var previews: some View {
        PokemonDetailPage(pokemon: .stubbed())
    }
}
#endif
