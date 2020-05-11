//
//  RoomTableViewCell.swift
//  Roomy
//
//  Created by Mohamed Canaria on 4/29/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit

class RoomTableViewCell: UITableViewCell {

    @IBOutlet weak var roomTitle: UILabel!
    @IBOutlet weak var roomPlace: UILabel!
    @IBOutlet weak var roomPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configureCell(title : String, price : String, place : String){
        roomTitle.text = title
        roomPlace.text = place
        roomPrice.text = price
    }
    
}
