//
//  AddRoomViewController.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 4/29/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit

class AddRoomViewController: UIViewController {
    
    // MARK:- Variables And Properties
    
    let api: RoomsAPIProtocol = RoomsAPI()
    
    // MARK:- IBOutlets
    
    @IBOutlet weak var roomTitle: UITextField!
    @IBOutlet weak var roomPlace: UITextField!
    @IBOutlet weak var roomPrice: UITextField!
    @IBOutlet weak var roomDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:- IBAction
    
    @IBAction func addTheRoom(_ sender: Any) {
        
        guard let roomTitle = self.roomTitle.text, !roomTitle.isEmpty else {
            return self.showAlert(title: "Add Room Failed", message: "Please make sure you add the room title to add the room.")
        }
        guard let roomPlace = self.roomPlace.text, !roomPlace.isEmpty else {
            return self.showAlert(title: "Add Room Failed", message: "Please make sure you add the room place to add the room.")
        }
        guard let roomPrice = self.roomPrice.text, !roomPrice.isEmpty else {
            return self.showAlert(title: "Add Room Failed", message: "Please make sure you add the room price to add the room.")
        }
        guard let roomDescription = self.roomDescription.text else { return }
        
        api.addRoom(title: roomTitle, place: roomPlace, price: roomPrice, description: roomDescription, authorization: UserKeychain.retrieveAuthorization()) { (result) in
            switch result {
            case .success(_):
                self.navigateToHomeTableViewController()
            case .failure(_):
                self.showAlert(title: "Add Room Failed", message: "Please make sure you filled the required info correctly to add the room.")
            }
        }
    }
    
}

