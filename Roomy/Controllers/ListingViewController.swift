//
//  ListingViewController.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 4/17/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
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
        roomMainImage.kf.setImage(with: URL(string: imageListing ?? ""))

    }
    


}
