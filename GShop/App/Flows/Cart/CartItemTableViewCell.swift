//
//  CartItemTableViewCell.swift
//  GShop
//
//  Created by Matthew on 24.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import UIKit

class CartItemTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
