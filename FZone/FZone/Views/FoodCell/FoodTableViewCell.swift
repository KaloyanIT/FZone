//
//  FoodTableViewCell.swift
//  FZone
//
//  Created by Kaloyan on 4/2/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    @IBOutlet weak var labelFoodName: UILabel!    
    @IBOutlet weak var labelFoodCalories: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
