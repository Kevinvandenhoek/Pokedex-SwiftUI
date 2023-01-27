//
//  EvolutionsRequest.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 20/01/2023.
//

import Foundation
import Requester

struct EvolutionsRequest: APIRequest {
    
    var backend: Backend { .pokeAPI }
    var method: APIMethod { .get }
    var path: String { "evolution-chain/\(id)/" }
    
    let id: Pokemon.ID
}

// MARK: Response
extension EvolutionsRequest {
    
    struct Response: Codable {
        let chain: Evolution
    }
    
    struct Evolution: Codable {
        let evolves_to: [Evolution]
        let evolution_details: [EvolutionDetails]
        let species: NamedLinkEntity
    }
    
    struct EvolutionDetails: Codable {
        let min_level: Int?
        let trigger: NamedLinkEntity
    }
}
