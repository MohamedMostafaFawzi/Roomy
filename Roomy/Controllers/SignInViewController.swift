//
//  SignInViewController.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 4/17/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit
import Alamofire
//
// MARK: - SignInViewController
//
class SignInViewController: UIViewController {
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
        let email = self.email.text!
        let password = self.password.text!
        
        
        Request.signIn(email: email, password: password) { (result) in
            switch result {
            case .success:
                // Connect it with the HomeTableViewController
                let HomeTableViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeTableViewController" ) as! HomeTableViewController
                self.navigationController?.pushViewController(HomeTableViewController, animated: true)
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
            
        }
        
    }
    
}
