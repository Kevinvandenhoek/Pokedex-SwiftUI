//
//  Array+Extension.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/01/2023.
//

import Foundation

struct NotFoundError: Error { }

extension Array {
    
    func firstOrThrow(where condition: ((Element) throws -> Bool)? = nil) throws -> Element {
        if let first = try first(where: { try condition?($0) ?? true }) {
            return first
        } else {
            throw NotFoundError()
        }
    }
}

extension Array where Element == Pokemon {
    
    func filtered(by searchTerm: String) -> Self {
        guard !searchTerm.isEmpty else { return self }
        return filter({ pokemon in
            return pokemon.name.lowercased().contains(searchTerm.lowercased())
        })
    }
    
    func filtered(by ids: [Pokemon.ID]) -> Self {
        return filter { pokemon in
            return ids.contains(pokemon.id)
        }
    }
}
