//
//  ANewsViewController.swift
//  Hackathon
//
//  Created by Risolat Fayzmamadova on 2/23/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit
import Kingfisher

class ANewsViewController: UIViewController {

    
    @IBOutlet weak var aNewsImage: UIImageView!
    @IBOutlet weak var aNewsTitle: UILabel!
    @IBOutlet weak var aNewsDescriptionLabel: UILabel!
    var newsTitle: String?
    var newsDescription: String?
    var newsImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.aNewsTitle.text = newsTitle
        self.aNewsDescriptionLabel.text = newsDescription
        
        let url = URL(string: newsImage!)
        self.aNewsImage.kf.setImage(with: url, placeholder: UIImage(named: "newsImg"), options: nil, progressBlock: nil, completionHandler: nil)
    }
}
