//
//  Pokemon+Mapper.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 06/01/2023.
//

import Foundation

extension Pokemon {
    
    static func map(_ entity: NamedLinkEntity) throws -> Pokemon {
        guard let idString = entity.url.pathComponents.last,
              let id = Int(idString) else { throw MappingError() }
        return Pokemon(
            id: id,
            name: entity.name.capitalized
        )
    }
}
