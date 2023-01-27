//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 19/01/2023.
//

import Foundation

struct PokemonDetail: Hashable {
    
    let id: Pokemon.ID
    let name: String
    let weight: Kilogram
    let height: Meter
    let stats: Stats
    let types: [String]
    let moves: [Move]
    let abilities: [Ability]
    let evolutions: [Evolution]
}

struct Move: Hashable {
    let name: String
}

struct Ability: Hashable {
    let name: String
}

struct Stats: Hashable {
    let hp: Int
    let attack: Int
    let defense: Int
    let specialAttack: Int
    let specialDefense: Int
    let speed: Int
}

struct Evolution: Hashable {
    let pokemon: Pokemon
    let trigger: Trigger
    
    enum Trigger: Hashable {
        case level(Int)
        case unknown
    }
}
