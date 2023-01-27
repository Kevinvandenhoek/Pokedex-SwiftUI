//
//  Pokemon+Stubs.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/01/2023.
//

import Foundation

#if DEBUG
extension Pokemon {
    
    static func stubbed(
        id: Int = 1,
        name: String = "Bulbasaur"
    ) -> Self {
        return Self(
            id: id,
            name: name
        )
    }
}
#endif
