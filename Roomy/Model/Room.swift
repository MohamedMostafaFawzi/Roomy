//
//  Room.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 4/24/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import Foundation
import RealmSwift
//
// MARK: - Room
//
class Room: Object, Codable {
    //
    // MARK: - Variables And Properties
    //
    @objc dynamic var id: Int
    @objc dynamic var title: String
    @objc dynamic var price: String
    @objc dynamic var place: String
    @objc dynamic var theDescription: String?
}
//
// MARK: - Room CodingKeys
//
extension Room {
    enum CodingKeys: String, CodingKey  {
        case id
        case title
        case price
        case place
        case theDescription = "description"
    }
}

