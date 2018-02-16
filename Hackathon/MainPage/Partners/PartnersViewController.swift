//
//  PartnersViewController.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/14/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class PartnersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    let partnersDictionary = ["Sponsors": ["ArabMoney", "Rakuten"], "Partners": ["Fly Emirates", "AIG", "Yokohama", "Shoro", "Nashe"], "Organizers": ["Neobis", "MadDevs"]]
    
    @IBOutlet weak var partnersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partnersDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = partnersTableView.dequeueReusableCell(withIdentifier: "partnersTableViewCell") as! PartnersTableViewCell
        cell.partnersLbl.text = Array(partnersDictionary.keys)[indexPath.row]
        
        return cell
    }
    
}
