//
//  LocalizedStringKey+Extension.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/01/2023.
//

import Foundation
import SwiftUI

extension LocalizedStringKey {
    
    static var pokemonListTitle: Self {
        return Self("pokemon_list.title")
    }
    
    static var pokemonListSearchFieldPlaceholder: Self {
        return Self("pokemon_list.search_field.placeholder")
    }
    
    static var pokemonTabTitle: Self {
        return Self("tab.pokemons.title")
    }
    
    static var favoritesTabTitle: Self {
        return Self("tab.favorites.title")
    }
}
