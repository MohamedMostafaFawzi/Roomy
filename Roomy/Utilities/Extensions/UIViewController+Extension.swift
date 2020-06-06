//
//  UIViewController+Extension.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 5/9/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit

extension UIViewController: UITextFieldDelegate {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func navigateToHomeTableViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeTableView = storyboard.instantiateViewController(identifier: "HomeTableViewController") as! HomeTableViewController
        homeTableView.modalPresentationStyle = .automatic
        self.present(homeTableView, animated: true, completion: nil)
    }
}


