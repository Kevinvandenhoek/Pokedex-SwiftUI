//
//  DetailRepository.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 19/01/2023.
//

import Foundation
import Factory
import Combine

@MainActor
class PokemonDetailRepository: ObservableObject {
    
    @Injected(Container.requester)
    private var requester
    
    @Published
    var detail: Result<PokemonDetail, Error>?
    
    init(for id: Pokemon.ID) {
        Task { await setup(id: id) }
    }
}

extension PokemonDetailRepository {
    
    func setup(id: Pokemon.ID) async {
        do {
            async let detailResult = requester.perform(PokemonDetailRequest(id: id))
            async let evolutionsResult = requester.perform(EvolutionsRequest(id: id))
            let mapped = try await PokemonDetail.map(detailResult, evolutionsResult)
            self.detail = .success(mapped)
        } catch {
            detail = .failure(error)
        }
    }
}

extension Container {

    static let detailRepository = ParameterFactory<Pokemon.ID, PokemonDetailRepository> { @MainActor id in
        PokemonDetailRepository(for: id)
    }
}
