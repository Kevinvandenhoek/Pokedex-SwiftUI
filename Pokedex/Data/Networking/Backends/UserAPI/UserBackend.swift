//
//  UserBackend.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 20/01/2023.
//

import Foundation
import Requester

extension Backend where Self == UserBackend {
    
    static var userAPI: Self {
        return Self()
    }
}

struct UserBackend: Backend {
    
    var baseURL: URL { URL(string: "about:blank")! }
    
    var authenticator: Requester.Authenticating? { nil }
    
    var requestProcessors: [Requester.URLRequestProcessing] { [] }
    
    var responseProcessors: [Requester.URLResponseProcessing] { [] }
    
    var sslCertificates: [Requester.Base64String] { [] }
}
