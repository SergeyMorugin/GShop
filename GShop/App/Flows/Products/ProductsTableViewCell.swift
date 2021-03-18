//
//  ProductsTableViewCell.swift
//  GShop
//
//  Created by Matthew on 18.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
