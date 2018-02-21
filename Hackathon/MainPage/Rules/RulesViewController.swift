//
//  RulesViewController.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/19/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {

    @IBOutlet weak var rulesDescriptionLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBar()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Правила участия"
    }
    
}
