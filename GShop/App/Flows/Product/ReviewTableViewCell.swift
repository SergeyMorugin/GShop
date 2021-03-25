//
//  ReviewTableViewCell.swift
//  GShop
//
//  Created by Matthew on 22.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showReview(review: Review?) {
        if let rev = review {
            userLabel.text = String(rev.userId)
            reviewLabel.text = rev.text
        } else {
            userLabel.text = ""
            reviewLabel.text = ""
        }
    }
    
}
