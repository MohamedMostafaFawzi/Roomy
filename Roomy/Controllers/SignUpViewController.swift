//
//  SignUpViewController.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 4/26/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit
import Alamofire
import NVActivityIndicatorView

class SignUpViewController: UIViewController, NVActivityIndicatorViewable {
    
    // MARK:- Variables And Properties

    let api: RoomsAPIProtocol = RoomsAPI()

    // MARK:- IBOutlets
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:- IBActions
    
    @IBAction func signUp(_ sender: Any) {
        startAnimating(type: .ballRotateChase)
        let name = self.name.text!
        let email = self.email.text!
        let password = self.password.text!
        
        api.signUp(name: name, email: email, password: password) { (result) in
            self.stopAnimating()
            switch result {
            case .success( let credentials):
                UserKeychain.saveAuthorization(authorization: credentials.authorization)
                self.navigateToHomeTableViewController()
            case .failure(_):
                self.showAlert(title: "Sign Up Failed", message: "Please make sure you filled the required info correctly to complete the registration.")
            }
        }
    }
    
}
