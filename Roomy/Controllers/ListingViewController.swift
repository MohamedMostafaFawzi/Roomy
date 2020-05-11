//
//  ListingViewController.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 4/17/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit
import Alamofire
//
// MARK: - ListingViewController
//
class ListingViewController: UIViewController {
    //
    // MARK: - Variables And Properties
    //
    var descriptionListing : String?
    var imageListing : String?
    //
    // MARK: - IBOutlets
    //
    @IBOutlet weak var roomMainImage: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionText.text = descriptionListing
        
    }
    
}
