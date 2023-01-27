//
//  Pokemon.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 30/12/2022.
//

import Foundation

struct Pokemon: Hashable, Identifiable {
    let id: ID
    let name: String
    
    var image: URL {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")!
    }
}

extension Pokemon {
    
    typealias ID = Int
}
