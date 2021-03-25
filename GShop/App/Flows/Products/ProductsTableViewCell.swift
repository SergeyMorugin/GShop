//
//  ProductsTableViewCell.swift
//  GShop
//
//  Created by Matthew on 18.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import UIKit

protocol ProductsTableViewCellDelegate {
    func addToCart(productId: Int)
}

class ProductsTableViewCell: UITableViewCell {
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    var productId: Int!
    var delegate: ProductsTableViewCellDelegate?
    
    
    @IBAction func addToCartClick(_ sender: Any) {
        delegate?.addToCart(productId: productId)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
