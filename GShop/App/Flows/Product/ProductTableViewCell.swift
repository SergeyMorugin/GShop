//
//  ProductTableViewCell.swift
//  GShop
//
//  Created by Matthew on 22.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import UIKit

@IBDesignable
class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func showProduct(product: ProductById?) {
        if let product = product {
            nameLabel.text = product.name
            descLabel.text = product.desc
            priceLabel.text = String(format: "$%.02f", Float(product.price)/100)
            
        } else {
            nameLabel.text = ""
            descLabel.text = ""
            priceLabel.text = ""
        }
    }
    
    
    
}
