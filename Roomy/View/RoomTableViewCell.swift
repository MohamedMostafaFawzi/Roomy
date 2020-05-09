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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
