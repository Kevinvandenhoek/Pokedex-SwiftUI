//
//  AllPokemonsRequest.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 30/12/2022.
//

import Foundation
import Requester
import Factory

struct AllPokemonsRequest: APIRequest {
    
    var method: APIMethod { .get }
    var path: String { "pokemon" }
    let backend: Backend = .pokeAPI
}

// MARK: Response
extension AllPokemonsRequest {
    
    struct Response: Codable {
        let next: URL?
        let previous: URL?
        let count: Int
        let results: [NamedLinkEntity]
    }
}



protocol GetPokemonWorker {
    
    func getAll() async throws -> [Pokemon]
    func get(by id: String) async throws -> Pokemon
}

struct GetPokemonService: GetPokemonWorker {
    
    func getAll() async throws -> [Pokemon] {
        return []
    }
    
    func get(by id: String) async throws -> Pokemon {
        return .stubbed()
    }
}

struct GetPokemonWorkerMock: GetPokemonWorker {
    
    let pokemons: [Pokemon]
    
    func getAll() async throws -> [Pokemon] {
        return []
    }
    
    func get(by id: String) async throws -> Pokemon {
        return .stubbed()
    }
}

extension GetPokemonWorker where Self == GetPokemonService {
    
    static var real: Self {
        return GetPokemonService()
    }
}

#if DEBUG
extension GetPokemonWorker where Self == GetPokemonWorkerMock {
    
    static func mocked(pokemons: [Pokemon]) -> Self {
        return Self(pokemons: pokemons)
    }
}
#endif

struct PokemonViewModel {
    
    let getPokemonWorker: GetPokemonWorker = .
}
