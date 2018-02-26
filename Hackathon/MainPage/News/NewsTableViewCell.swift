//
//  NewsTableViewCell.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/13/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    //@IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsView: UIView! {
        didSet {
            newsView.layer.cornerRadius = 10
        }
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
