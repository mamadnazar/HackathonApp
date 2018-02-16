//
//  NewsTableViewCell.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/13/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsTitleLbl: UILabel!
    @IBOutlet weak var newsDescriptionLbl: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
