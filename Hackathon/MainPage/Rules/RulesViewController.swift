//
//  RulesViewController.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/19/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var rulesTableView: UITableView!
    
    var rules = Rules()
    override func viewDidLoad() {
        super.viewDidLoad()

        rulesTableView.tableFooterView = UIView()
        self.setNavigationBar()
        ServerManager.shared.getRules(getRules, error: showErrorAlert)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Правила участия"
    }
    
    func getRules(rules: Rules) {
        self.rules = rules
        self.rulesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(rules.array.count)
        return rules.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rulesCellID", for: indexPath) as! RulesTableViewCell
        cell.rulesTableViewTitle.text = rules.array[indexPath.item].title
        cell.rulesTableViewDescription.text = rules.array[indexPath.item].description
        cell.rulesTableViewLink.text = rules.array[indexPath.item].link
        return cell
    }

}
