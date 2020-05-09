//
//  Request.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 4/26/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
//
// MARK:- Network Requests
//
class Request {
    //
    // MARK:- SignIn Request Function
    //
    static func signIn(email: String, password: String, _ completionHandler: @escaping (Result<User, Error>) -> Void) {
        
        AF.request(Router.signIn(email: email, password: password)).responseData { (response: AFDataResponse<Data>) in
            switch response.result {
            case .success(let data):
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    completionHandler(.success(user))

                    let authorizationCode = user.authorization
                    UserDefaults.standard.setValue(authorizationCode, forKey: "auth_token")
                    User.authorizationCode = authorizationCode
                    
                } catch let error {
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
        
    }
    //
    // MARK:- SignUp Request Function
    //
    static func signUp(name: String, email: String, password: String, _ completionHandler: @escaping (Result<User, Error>) -> Void) {
        
        AF.request(Router.signUp(name: name, email: email, password: password)).responseData { (response: AFDataResponse<Data>) in
            switch response.result {
            case .success(let data):
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    completionHandler(.success(user))
                    
                    let authorizationCode = user.authorization
                    UserDefaults.standard.setValue(authorizationCode, forKey: "auth_token")
                    User.authorizationCode = authorizationCode
                    
                } catch let error {
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
        
    }
    //
    // MARK:- AddRoom Request Function
    //
    static func addRoom(title: String, place: String, price: String, description: String?, image: UIImage?,authorization: String, _ completionHandler: @escaping (Result<Bool, Error>) -> Void) {
        AF.request(Router.addRoom(title: title, place: place, price: price, description: description, image: image, authorization: authorization)).responseData { (response: AFDataResponse<Data>) in
            switch response.result {
            case .success(_ ):
                completionHandler(.success(true))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
        
    }
    //
    // MARK:- GetRooms Request Function
    //
    static func getRooms(authorization: String, _ completionHandler: @escaping (Result<[Room], Error>) -> Void) {
        
        AF.request(Router.getRooms(authorization: authorization)).responseData { (response: AFDataResponse<Data>) in
            switch response.result {
            case .success(let data):
                do {
                    let rooms = try JSONDecoder().decode([Room].self, from: data)
                    let realm = try! Realm()
                    if realm.isEmpty{
                        try realm.write {
                            realm.add(rooms)
                        }
                    }
                    completionHandler(.success(rooms))
                } catch let error {
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
        
    }
    
}
