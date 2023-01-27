//
//  PokemonBackend.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 30/12/2022.
//

import Foundation
import Requester

extension Backend where Self == PokemonBackend {
    
    static var pokeAPI: Self {
        return Self()
    }
}

struct PokemonBackend: Backend {
    
    var baseURL: URL { URL(string: "https://pokeapi.co/api/v2/")! }
    
    var authenticator: Requester.Authenticating? { nil }
    
    var requestProcessors: [Requester.URLRequestProcessing] { [] }
    
    var responseProcessors: [Requester.URLResponseProcessing] { [] }
    
    var sslCertificates: [Requester.Base64String] { [] }
}
