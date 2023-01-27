//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 06/01/2023.
//

import Foundation
import Factory

@MainActor
class PokemonRepository: ObservableObject {
    
    @Injected(Container.requester)
    private var requester
    
    @Published var pokemons: Result<[Pokemon], Error>?
    
    init() {
        Task { await fetch() }
    }
}

extension PokemonRepository {
    
    @Sendable
    func fetch() async {
        do {
            let result = try await requester.perform(AllPokemonsRequest())
            let mapped = try result.results.map(Pokemon.map)
            pokemons = .success(mapped)
        } catch {
            pokemons = .failure(error)
        }
    }
}

extension Container {
    
    static let pokemonRepository = Factory(scope: .cached) { @MainActor in
        PokemonRepository()
    }
}
