//
//  LifehacksViewController.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/14/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class LifehacksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let lifehacks = ["LifeHack #1", "Don't drink uksus", "Talk with Ismet", "Wear helmet while cutting onion"]
    
    let lifehackLinks = ["example.com", "uksus.ru", "ismetzver.tm", "don'tfuckwithonion.com"]
    
    @IBOutlet weak var LifeHacksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBar()
        LifeHacksTableView.tableFooterView = UIView()
        LifeHacksTableView.rowHeight = UITableViewAutomaticDimension
        LifeHacksTableView.estimatedRowHeight = 110
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Sponsors and Partners"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lifehacks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LifeHacksTableView.dequeueReusableCell(withIdentifier: "lifehacksCell") as! LifehacksTableViewCell
        
        cell.lifehacksTitleLbl.text = lifehacks[indexPath.row]
        cell.lifehacksLinkLbl.text = lifehackLinks[indexPath.row]
        cell.lifehacksImage.image = UIImage(named: "lifehacksImg")
        return cell
    }
}
