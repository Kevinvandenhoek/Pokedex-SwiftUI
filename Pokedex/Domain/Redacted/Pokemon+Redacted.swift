//
//  Pokemon+Redacted.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/01/2023.
//

import Foundation

extension Array where Element == Pokemon {
    
    static var redacted: [Pokemon] {
        return (0..<151).map({ Pokemon(id: $0, name: "\($0)") })
    }
}
