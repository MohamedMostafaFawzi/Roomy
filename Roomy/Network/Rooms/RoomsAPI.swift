//
//  RoomsAPI.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 6/7/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import Foundation


protocol RoomsAPIProtocol {
    func signIn(email: String, password: String, completionHandler: @escaping (Result<Credentials, NSError>) -> Void)
    func signUp(name: String, email: String, password: String, completionHandler: @escaping (Result<Credentials, NSError>) -> Void)
    func addRoom(title: String, place: String, price: String, description: String, authorization: String, completionHandler: @escaping (Result<Room, NSError>) -> Void)
    func getRooms(completionHandler: @escaping (Result<[Room], NSError>) -> Void)
    
}

class RoomsAPI: BaseAPI<RoomsNetworking>, RoomsAPIProtocol {
    
    // MARK:- SignIn Request Function
    
    func signIn(email: String, password: String, completionHandler: @escaping (Result<Credentials, NSError>) -> Void) {
        self.fetchData(target: .signIn(email: email, password: password), responseClass: Credentials.self) { (result) in
            completionHandler(result)
        }
    }
    
    // MARK:- SignUp Request Function
    
    func signUp(name: String, email: String, password: String, completionHandler: @escaping (Result<Credentials, NSError>) -> Void) {
        self.fetchData(target: .signUp(name: name, email: email, password: password), responseClass: Credentials.self) { (result) in
            completionHandler(result)
        }
    }
    
    // MARK:- AddRoom Request Function
    
    func addRoom(title: String, place: String, price: String, description: String, authorization: String, completionHandler: @escaping (Result<Room, NSError>) -> Void) {
        self.fetchData(target: .addRoom(title: title, place: place, price: price, description: description), responseClass: Room.self) { (result) in
            completionHandler(result)
        }
    }
    
    // MARK:- GetRooms Request Function
    
    func getRooms(completionHandler: @escaping (Result<[Room], NSError>) -> Void) {
        self.fetchData(target: .getRooms, responseClass: [Room].self) { (result) in
            completionHandler(result)
        }
        
    }
    
    
    
}
