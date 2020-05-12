//
//  APIClient.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 5/9/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import Alamofire
import RealmSwift

class APIClient {
    
    // MARK:- SignIn Request Function
    
    static func signIn(email: String, password: String, _ completionHandler: @escaping (Result<Bool, Error>) -> Void) {
        
        AF.request(APIRouter.signIn(email: email, password: password)).responseData { (response: AFDataResponse<Data>) in
            switch response.result{
            case .success(let data):
                do{
                    let credentials = try JSONDecoder().decode(Credentials.self, from: data)
                    if credentials.authorization.isEmpty{
                        completionHandler(.success(false))
                    }else{
                        UserKeychain.saveAuthorization(authorization: credentials.authorization)
                        completionHandler(.success(true))
                    }
                }catch{
                    completionHandler(.success(false))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    // MARK:- SignUp Request Function
    
    static func signUp(name: String, email: String, password: String, _ completionHandler: @escaping (Result<Bool, Error>) -> Void) {
        
        AF.request(APIRouter.signUp(name: name, email: email, password: password)).responseData { (response: AFDataResponse<Data>) in
            switch response.result{
            case .success(let data):
                do{
                    let credentials = try JSONDecoder().decode(Credentials.self, from: data)
                    if credentials.authorization.isEmpty{
                        completionHandler(.success(false))
                    }else{
                        UserKeychain.saveAuthorization(authorization: credentials.authorization)
                        completionHandler(.success(true))
                    }
                }catch{
                    completionHandler(.success(false))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    // MARK:- AddRoom Request Function
    
    static func addRoom(title: String, place: String, price: String, description: String, authorization: String, _ completionHandler: @escaping (Result<Bool, Error>) -> Void) {
        AF.request(APIRouter.addRoom(title: title, place: place, price: price, description: description)).responseData { (response: AFDataResponse<Data>) in
            switch response.result {
            case .success(_):
                completionHandler(.success(true))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    // MARK:- GetRooms Request Function
    
    static func getRooms(_ completionHandler: @escaping (Result<[Room],Error>) -> Void) {
        
        AF.request(APIRouter.getRooms).responseData { (response: AFDataResponse<Data>) in
            switch response.result{
            case .success(let data):
                do {
                    let roomsList = try JSONDecoder().decode([Room].self, from: data)
                    completionHandler(.success(roomsList))
                } catch let error {
                    completionHandler(.failure(error))
                    print("Error Decoding: \(error)")
                }
            case .failure(let error):
                completionHandler(.failure(error))
                print("Error Getting Rooms: \(error)")
            }
        }
    }
    
    
}

