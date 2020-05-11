//
//  RealmManger.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 4/30/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import Foundation
import RealmSwift


class RealmManager{
    
    private static let realm = try! Realm()
    
    static func saveRooms(rooms:[Room]){
        try! realm.write {
            realm.add(rooms)
        }
    }
    
    static func getRooms()-> [Room]{
        let rooms = realm.objects(Room.self)
        var roomsArray = [Room]()
        for room in rooms {
            roomsArray.append(room)
        }
        return roomsArray
    }
    
}
