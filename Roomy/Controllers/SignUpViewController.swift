//
//  SignUpViewController.swift
//  Roomy
//
//  Created by Mohamed  Mostafa Fawzi on 4/26/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit
import Alamofire
import NVActivityIndicatorView
//
// MARK: - SignUpViewController
//
class SignUpViewController: UIViewController, NVActivityIndicatorViewable {
    //
    // MARK: - IBOutlets
    //
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //
    // MARK: - IBActions
    //
    @IBAction func signUp(_ sender: Any) {
        startAnimating()
        let name = self.name.text!
        let email = self.email.text!
        let password = self.password.text!
        
        APIClient.signUp(name: name, email: email, password: password) { (result) in
            self.stopAnimating()
            switch result {
                
            case .success(let success):
                if success {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let homeTableView = storyboard.instantiateViewController(identifier: "HomeTableViewController") as! HomeTableViewController
                homeTableView.modalPresentationStyle = .automatic
                self.present(homeTableView, animated: true, completion: nil)
                }else {
                    self.showAlert(title: "Sign Up Failed", message: "Please make sure you filled the required info correctly to complete the registration.")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(title: "Sign Up Failed", message: "Please make sure you filled the required info correctly to complete the registration.")
                
            }
        }
        
    }
    
    
}
