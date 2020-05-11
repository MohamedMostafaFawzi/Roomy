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
    
    // MARK:- Variables And Properties
    static let userTokenId = "Token"
    
    // MARK:- Internal Class Functions
    internal class func saveUserToken(userToken : String){
        let keychain = KeychainSwift()
        keychain.set(userToken, forKey: userTokenId)
    }
    
    internal class func retrieveUserToken() -> String? {
        let keychain = KeychainSwift()
        return keychain.get(userTokenId)
    }
    
}
