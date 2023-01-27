//
//  HomeScene.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 30/12/2022.
//

import Foundation
import SwiftUI
import Factory

struct HomePage: View {
    
    var body: some View {
        NavigationView {
            ZStack { // Embedding inside ZStack solves tabbar transparency bug
                TabView {
                    PokemonListPage()
                        .tabItem { Label(.pokemonTabTitle, image: "tab_pokemon") }
                    PokemonFavoritesPage()
                        .tabItem { Label(.favoritesTabTitle, image: "tab_favorites") }
                }
            }
        }
    }
}

#if DEBUG
struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
#endif
