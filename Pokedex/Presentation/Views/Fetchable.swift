//
//  Fetchable.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 06/01/2023.
//

import Foundation

enum Fetched<Item, E: Error> {
    case initial
    case loading
    case fetched(Item)
    case error(E)
}
