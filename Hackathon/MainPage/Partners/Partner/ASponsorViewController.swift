//
//  ASponsorViewController.swift
//  Hackathon
//
//  Created by Risolat Fayzmamadova on 2/22/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class ASponsorViewController: UIViewController {

    @IBOutlet weak var sponsorImage: UIImageView!
    @IBOutlet weak var sponsorNameLabel: UILabel!
    @IBOutlet weak var sponsorDescriptionLabel: UILabel!
    @IBOutlet weak var sponsorURLLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBar()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.title = "Спонсоры и партнеры"
    }
    
    

}
