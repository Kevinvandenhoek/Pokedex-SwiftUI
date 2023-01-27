//
//  PokemonGridView+Modifiers.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 19/01/2023.
//

import Foundation
import SwiftUI

extension PokemonGridView {
    
    @ViewBuilder
    func ifEmpty<Fallback: View>(@ViewBuilder fallback: () -> Fallback) -> some View {
        if pokemons.isEmpty {
            fallback()
        } else {
            self
        }
    }
}
