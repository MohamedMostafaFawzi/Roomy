//
//  Router.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 4/26/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import Foundation
import Alamofire
//
// MARK: - Router
//
enum Router: URLRequestConvertible {
    //
    // MARK: - case
    //
        case signIn(email: String, password: String)
        case signUp(name: String, email: String, password: String)
    case getRooms(authorization: String)
        case addRoom(title: String, place: String, price: String, description: String?, image: UIImage?, authorization: String)
        //
        // MARK: - url
        //
        var url : URL {
            switch self {
            case .signIn:
                return URL(string: "https://roomy-application.herokuapp.com/auth/login")!
            case .signUp:
                return URL(string: "https://roomy-application.herokuapp.com/signup")!
            case .getRooms:
                return URL(string: "https://roomy-application.herokuapp.com/rooms")!
            case .addRoom:
                return URL(string: "https://roomy-application.herokuapp.com/rooms")!
            }
            
        }
    //
    // MARK: - method
    //
        var method : HTTPMethod {
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
    //
    // MARK: - parameters
    //
        var parameters : [String:Any]{
            switch self {
            case .signIn(let email, let password):
                return ["email":email,
                        "password": password]
            case . signUp(let name, let email, let password):
                return ["name":name,
                        "email":email,
                        "password":password]
                
            case .addRoom(let title, let place, let price, let description, let image, let authorization):
                return ["title":title,
                        "place":place,
                        "price":price,
                        "description":description ?? "",
                        "image":image ?? "",
                        "authorization":authorization]
            default:
                return [:]
            }
            
            
            var headers: HTTPHeaders {
                    switch self {
                    case .signIn:
                        return [:]
                    case . signUp:
                        return [:]
                    case .getRooms(let authorization):
                    return [
                        "Authorization": authorization,
                        "Accept": "application/json"
                    ]
                    case .addRoom(let authorization):
                        return [
                            "Authorization": authorization,
                            "Accept": "application/json"
                        ]
                    }
                
                }
            
        }
    

        func asURLRequest() throws -> URLRequest {
            var urlRequest = URLRequest(url: url)
            // HTTP Method
            urlRequest.method = method
            // Common Headers
            urlRequest.setValue(User.authorizationCode, forHTTPHeaderField: "Authorization")
            return try URLEncoding.default.encode(urlRequest, with: parameters)
            
            
        }
    }
