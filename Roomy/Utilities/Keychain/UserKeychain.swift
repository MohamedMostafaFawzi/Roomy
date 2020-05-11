//
//  UserKeychain.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 5/9/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import Foundation
import KeychainSwift


class UserKeychain {
    
    static let userTokenId = "Token"
    
    internal class func saveUserToken(userToken : String){
        let keychain = KeychainSwift()
        keychain.set(userToken, forKey: userTokenId)
    }
    
    internal class func retrieveUserToken() -> String? {
        let keychain = KeychainSwift()
        return keychain.get(userTokenId)
    }
}
