//
//  ViewController.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/5/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Open: UIBarButtonItem!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.gestureRecognizerShouldBegin(self.revealViewController().panGestureRecognizer())
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Новости и объявления"
    }

}

