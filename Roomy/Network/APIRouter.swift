//
//  APIRouter.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 5/9/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case signIn(email: String, password: String)
    case signUp(name: String, email: String, password: String)
    case getRooms
    case addRoom(title: String, place: String, price: String, description: String)
    
    // MARK:- HTTPMethod
    private var method: HTTPMethod {
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
    
    // MARK:- Path
    private var path: String {
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
    
    // MARK:- Parameters
    private var parameters: Parameters? {
        switch self {
        case .signIn(let email, let password):
            return [Constant.Parameter.email: email, Constant.Parameter.password: password]
        case .signUp(let email, let password, let name):
            return [Constant.Parameter.email: email, Constant.Parameter.password: password, Constant.Parameter.name: name]
        case .getRooms:
            return [:]
        case .addRoom(let title, let place, let price, let description):
            return [Constant.Parameter.title: title, Constant.Parameter.place: place, Constant.Parameter.price: price, Constant.Parameter.description: description]
        }
    }
    
    // MARK:- URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constant.Server.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(UserKeychain.retrieveAuthorization(), forHTTPHeaderField: Header.authentication.rawValue)
        
        return try URLEncoding.default.encode(urlRequest, with: parameters)
    }
    
}
