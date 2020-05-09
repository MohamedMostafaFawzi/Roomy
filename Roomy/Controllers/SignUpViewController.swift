//
//  SignUpViewController.swift
//  Roomy
//
//  Created by Mohamed  Mostafa Fawzi on 4/26/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit
import Alamofire
//
// MARK: - SignUpViewController
//
class SignUpViewController: UIViewController {
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
        let name = self.name.text!
        let email = self.email.text!
        let password = self.password.text!
        
        Request.signUp(name: name, email: email, password: password) { (result) in
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
