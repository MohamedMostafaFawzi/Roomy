//
//  AddRoomViewController.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 4/29/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit

class AddRoomViewController: UIViewController {
    
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
        
        guard let roomTitle = self.roomTitle.text else { return }
        guard let roomPlace = self.roomPlace.text else { return }
        guard let roomPrice = self.roomPrice.text else { return }
        guard let roomDescription = self.roomDescription.text else { return }
        
        APIClient.addRoom(title: roomTitle, place: roomPlace, price: roomPrice, description: roomDescription, authorization: UserKeychain.retrieveUserToken() ?? "") { response in
            switch response{
            case .success(_ ):
                let homeTableView = UIStoryboard(name: "Main", bundle : nil).instantiateViewController(identifier: "HomeTableViewController" ) as! HomeTableViewController
                homeTableView.modalPresentationStyle = .automatic
                self.present(homeTableView, animated: true, completion: nil)
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(title: "Add Room Failed", message: "Please make sure you filled the required info correctly to add the room.")
            }
        }
    }
    
}

