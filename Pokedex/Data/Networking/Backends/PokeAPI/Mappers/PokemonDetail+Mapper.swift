//
//  PokemonDetail+Mapper.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 19/01/2023.
//

import Foundation

extension PokemonDetail {
    
    static func map(_ entity: PokemonDetailRequest.Response, _ evolution: EvolutionsRequest.Response) throws -> Self {
        return PokemonDetail(
            id: entity.id,
            name: entity.name,
            weight: entity.weight / 1000,
            height: entity.height / 100,
            stats: try mapStats(entity),
            types: try mapTypes(entity),
            moves: try mapMoves(entity),
            abilities: try mapAbilities(entity),
            evolutions: try mapEvolutions([evolution.chain])
        )
    }
}

private extension PokemonDetail {
    
    static func mapStats(_ entity: PokemonDetailRequest.Response) throws -> Stats {
        return Stats(
            hp: try entity.stats.firstOrThrow(where: { $0.stat.name == "hp" }).base_stat,
            attack: try entity.stats.firstOrThrow(where: { $0.stat.name == "attack" }).base_stat,
            defense: try entity.stats.firstOrThrow(where: { $0.stat.name == "defense" }).base_stat,
            specialAttack: try entity.stats.firstOrThrow(where: { $0.stat.name == "specialAttack" }).base_stat,
            specialDefense: try entity.stats.firstOrThrow(where: { $0.stat.name == "specialDefense" }).base_stat,
            speed: try entity.stats.firstOrThrow(where: { $0.stat.name == "speed" }).base_stat
        )
    }
    
    static func mapTypes(_ entity: PokemonDetailRequest.Response) throws -> [String] {
        return entity.types.map({ $0.type.name })
    }
    
    static func mapMoves(_ entity: PokemonDetailRequest.Response) throws -> [Move] {
        return entity.moves.map({ move in
            return Move(
                name: move.move.name
            )
        })
    }
    
    static func mapAbilities(_ entity: PokemonDetailRequest.Response) throws -> [Ability] {
        return entity.abilities.map({ ability in
            return Ability(
                name: ability.ability.name
            )
        })
    }
    
    static func mapEvolutions(_ evolutions: [EvolutionsRequest.Evolution], previous: [Evolution] = []) throws -> [Evolution] {
        return [] // TODO: Fix
//        if let next = evolutions.reduce(into: [EvolutionsRequest.Evolution].self, { $0 + $1 }).evolves_to {
//            return mapEvolutions(next, previous: previous)
//        } else {
//            return evolutions.map({ evolution in
//                return Evolution(
//                    pokemon: Pokemon.map(evolution.species),
//                    trigger: try mapEvolutionTrigger(evolution.evolution_details)
//                )
//            })
//        }
    }
    
    static func mapEvolutionTrigger(_ details: [EvolutionsRequest.EvolutionDetails]) throws -> Evolution.Trigger {
        if let level = try details.firstOrThrow().min_level {
            return .level(level)
        } else {
            return .unknown
        }
    }
}
