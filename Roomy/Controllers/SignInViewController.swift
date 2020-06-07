//
//  SignInViewController.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 4/17/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit
import Alamofire
import NVActivityIndicatorView

class SignInViewController: UIViewController, NVActivityIndicatorViewable {
    
    // MARK:- Variables And Properties

    let api: RoomsAPIProtocol = RoomsAPI()
    
    // MARK:- IBOutlets
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK:- IBActions
    
    @IBAction func signIn(_ sender: Any) {
        startAnimating(type: .ballRotateChase)
        let email = self.email.text!
        let password = self.password.text!
        
        api.signIn(email: email, password: password) { (result) in
            self.stopAnimating()
            switch result {
            case .success(let credentials):
                UserKeychain.saveAuthorization(authorization: credentials.authorization)
                self.navigateToHomeTableViewController()
            case .failure(_):
                self.showAlert(title: "Sign In Failed", message: "Please check the email and password and try again.")
            }
        }
    }
    
}
