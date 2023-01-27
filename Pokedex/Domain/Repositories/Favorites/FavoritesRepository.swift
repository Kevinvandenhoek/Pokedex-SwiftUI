//
//  FavoritesRepository.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/01/2023.
//

import Foundation
import Factory
import Combine

@MainActor
class FavoritesRepository: ObservableObject {
    
    @Injected(Container.requester)
    private var requester
    
    @Published var ids: Result<[Pokemon.ID], Error>?
    
    init() {
        Task { await setup() }
    }
}

extension FavoritesRepository {
    
    func toggleFavorite(for id: Pokemon.ID) {
        guard let ids = try? ids?.get() else {
            return assertionFailure("Shouldn't toggle favorites when not initialized")
        }
        
        let newIds: [Pokemon.ID]
        if ids.contains(id) {
            newIds = ids.filter({ $0 != id })
        } else {
            newIds = ids + [id]
        }
        print("gon set newIds to \(newIds)")
        self.ids = .success(newIds)
    }
    
    func setup() async {
//        do {
            ids = .success([]) // TODO: Fetch from backend
//        } catch {
//            ids = .failure(error)
//        }
    }
}

extension Container {
    
    static let favoritesRepository = Factory(scope: .cached) { @MainActor in
        FavoritesRepository()
    }
}
