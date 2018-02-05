//
//  FeedCellTableViewCell.swift
//  Instagram
//
//  Created by Shaurya Sinha on 04/02/18.
//  Copyright © 2018 Shaurya Sinha. All rights reserved.
//

import UIKit

class FeedCellTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var imageURLString = String()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
