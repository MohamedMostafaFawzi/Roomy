//
//  Credentials.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 4/24/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import Foundation

struct Credentials: Codable {

    // MARK:- Variables And Properties

    var message: String {return messagePrivate ?? ""}
    var authorization: String {return authorizationPrivate ?? ""}
    
    private var messagePrivate: String?
    private var authorizationPrivate: String?
}

// MARK:- User CodingKeys

extension Credentials {
    enum CodingKeys: String, CodingKey {
        case messagePrivate = "message"
        case authorizationPrivate = "auth_token"
    }
}
