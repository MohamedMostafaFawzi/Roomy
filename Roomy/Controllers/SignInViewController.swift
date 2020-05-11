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
//
// MARK: - SignInViewController
//
class SignInViewController: UIViewController, NVActivityIndicatorViewable {
    //
    // MARK: - IBOutlets
    //
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //
    // MARK: - IBActions
    //
    @IBAction func signIn(_ sender: Any) {
        startAnimating()
        let email = self.email.text!
        let password = self.password.text!
        
        APIClient.signIn(email: email, password: password) { (result) in
            self.stopAnimating()
            switch result {
                
            case .success(let success):
                if success {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let homeTableView = storyboard.instantiateViewController(identifier: "HomeTableViewController") as! HomeTableViewController
                homeTableView.modalPresentationStyle = .automatic
                self.present(homeTableView, animated: true, completion: nil)
                }else{
                    self.showAlert(title: "Sign In Failed", message: "Please check the email and password and try again.")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(title: "Sign In Failed", message: "Please check the email and password and try again.")
                
            }
            
        }
        
    }
    
}
