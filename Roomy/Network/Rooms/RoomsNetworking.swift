//
//  RoomsNetworking.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 6/7/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import Foundation
import Alamofire

enum RoomsNetworking {
    case signIn(email: String, password: String)
    case signUp(name: String, email: String, password: String)
    case getRooms
    case addRoom(title: String, place: String, price: String, description: String)
}

extension RoomsNetworking: TargetType {
    
    var baseURL: String {
        switch self {
        default:
            return Constant.Server.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .signIn:
            return "/auth/login"
        case .signUp:
            return "/signup"
        case .getRooms:
            return "/rooms"
        case .addRoom:
            return "/rooms"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .signIn:
            return .post
        case . signUp:
            return .post
        case .getRooms:
            return .get
        case .addRoom:
            return.post
        }
    }
    
    var task: Task {
        switch self {
        case .signIn(let email, let password):
            return .requestParameters(parameters: [Constant.Parameter.email: email, Constant.Parameter.password: password], encoding: URLEncoding.default)
        case .signUp(let name, let email, let password):
            return .requestParameters(parameters: [Constant.Parameter.email: email, Constant.Parameter.password: password, Constant.Parameter.name: name], encoding: URLEncoding.default)
        case .getRooms:
            return .requestPlain
        case .addRoom( let title, let place, let price, let description):
            return.requestParameters(parameters: [Constant.Parameter.title: title, Constant.Parameter.place: place, Constant.Parameter.price: price, Constant.Parameter.description: description], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [Header.authentication.rawValue: UserKeychain.retrieveAuthorization()]
        }
    }
    
    
}
