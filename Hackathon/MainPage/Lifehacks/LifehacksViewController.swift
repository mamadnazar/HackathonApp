//
//  LifehacksViewController.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/14/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class LifehacksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//    let lifehacks = ["LifeHack #1", "Don't drink uksus", "Talk with Ismet", "Wear helmet while cutting onion"]
//    let lifehackLinks = ["example.com", "uksus.ru", "ismetzver.tm", "don'tfuckwithonion.com"]
    
    var lifehacks = Lifehacks()
    
    @IBOutlet weak var LifeHacksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBar()
        ServerManager.shared.getLifehacks(getLifehacks, error: showErrorAlert)
        LifeHacksTableView.tableFooterView = UIView()
        LifeHacksTableView.rowHeight = UITableViewAutomaticDimension
        LifeHacksTableView.estimatedRowHeight = 110
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Sponsors and Partners"
    }

    func getLifehacks(lifehacks: Lifehacks) {
        self.lifehacks = lifehacks
        self.LifeHacksTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lifehacks.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LifeHacksTableView.dequeueReusableCell(withIdentifier: "lifehacksCell") as! LifehacksTableViewCell
        cell.lifeHacksTitleLabel.text = lifehacks.array[indexPath.item].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "aLifehackVC") as! ALifehackViewController
        vc.lifehackTitle = lifehacks.array[indexPath.item].title
        vc.lifehackDescription = lifehacks.array[indexPath.item].description
        vc.lifehackImg = lifehacks.array[indexPath.item].image_url
        vc.lifehackLink = lifehacks.array[indexPath.item].link
        self.navigationController?.show(vc, sender: self)
    }
    
    
}
