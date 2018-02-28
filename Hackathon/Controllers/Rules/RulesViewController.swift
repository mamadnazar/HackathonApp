//
//  RulesViewController.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/19/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var rules = Rules()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
		tableView.estimatedRowHeight = 50
		tableView.rowHeight = UITableViewAutomaticDimension
        self.setNavigationBar()
        ServerManager.shared.getRules(getRules, error: showErrorAlert)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Правила участия"
    }
    
    func getRules(rules: Rules) {
        self.rules = rules
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rules.array.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "rulesLogoHeaderCell", for: indexPath)
			return cell
		}
        let cell = tableView.dequeueReusableCell(withIdentifier: "RulesTableViewCell", for: indexPath) as! RulesTableViewCell
		cell.rule = rules.array[indexPath.row - 1]
        return cell
    }

}
