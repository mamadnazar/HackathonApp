//
//  FAQTableViewCell.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/14/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class FAQTableViewCell: UITableViewCell {

    
    @IBOutlet weak var FAQQuestionLbl: UILabel! {
        didSet {
            FAQQuestionLbl.textColor = UIColor(red: 246/255, green: 85/255, blue: 81/255, alpha: 1)
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
    
    func setQuestion() {
        FAQQuestionLbl.textColor = UIColor(red: 246/255, green: 85/255, blue: 81/255, alpha: 1)

    }
    func setAnswer() {
        FAQQuestionLbl.textColor = .black

    }
}
