//
//  ALifehackViewController.swift
//  Hackathon
//
//  Created by Risolat Fayzmamadova on 2/23/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class ALifehackViewController: UIViewController {

    
    @IBOutlet weak var aLifehackImage: UIImageView!
    @IBOutlet weak var aLifehackTitleLabel: UILabel! {
        didSet {
            aLifehackTitleLabel.textColor = UIColor(red: 246/255, green: 85/255, blue: 81/255, alpha: 1)
        }
    }
    @IBOutlet weak var aLifehackDescriptionLabel: UILabel!
    @IBOutlet weak var aLifehackLink: UITextView!
    var lifehackImg: String?
    var lifehackTitle: String?
    var lifehackDescription: String?
    var lifehackLink: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.aLifehackTitleLabel.text = lifehackTitle
        self.aLifehackDescriptionLabel.text = lifehackDescription
        self.aLifehackLink.text = lifehackLink
        let url = URL(string: lifehackImg!)
        self.aLifehackImage.kf.setImage(with: url, placeholder: UIImage(named: "lifehacksImage"), options: nil, progressBlock: nil, completionHandler: nil)
        // Do any additional setup after loading the view.
    }

}
