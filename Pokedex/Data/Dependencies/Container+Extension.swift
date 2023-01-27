//
//  Container+Extension.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 06/01/2023.
//

import Foundation
import Factory
import Requester

extension Container {
    
    static let requester = Factory { APIRequester() }
}
