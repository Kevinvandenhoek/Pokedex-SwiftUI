//
//  PokemonDetailRequest.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 19/01/2023.
//

import Foundation
import Requester

struct PokemonDetailRequest: APIRequest {
    
    var backend: Backend { .pokeAPI }
    var method: APIMethod { .get }
    var path: String { "pokemon/\(id)/" }
    
    let id: Pokemon.ID
}

// MARK: Response
extension PokemonDetailRequest {
    
    struct Response: Codable {
        let id: Int
        let name: String
        let weight: Double
        let height: Double
        let abilities: [Ability]
        let moves: [Move]
        let types: [`Type`]
        let stats: [Stat]
        let evolutions: [Evolution]
    }
    
    struct Ability: Codable {
        
        let ability: NamedLinkEntity
        let is_hidden: Bool
        let slot: Int
    }
    
    struct Move: Codable {
        
        let move: NamedLinkEntity
        let version_group_details: [MoveDetail]
        
        struct MoveDetail: Codable {
            let level_learned_at: Int
            let move_learn_method: NamedLinkEntity
            let version_group: NamedLinkEntity
        }
    }
    
    struct `Type`: Codable {
        let slot: Int
        let type: NamedLinkEntity
    }
    
    struct Stat: Codable {
        let base_stat: Int
        let effort: Int
        let stat: NamedLinkEntity
    }
    
    struct Evolution: Codable {
        
    }
}
