//
//  NewsViewController.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/13/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let newsTitles = ["President sovershil sui..", "Cho-to cho-to", "Fake news", "Weather"]
    let newsDescriptions = ["President sovershil sui-koi", "Cho-to cho-to prosto eshe dlinee", "Not Fake News", "esli vam ochen xolodno to skoree vsego temperatura nizhe nulya"]
    
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBar()
        newsTableView.rowHeight = UITableViewAutomaticDimension
        newsTableView.estimatedRowHeight = 110
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Новости и объявления"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "newsTableViewCell") as! NewsTableViewCell
        
        cell.newsTitleLbl.text = newsTitles[indexPath.row]
        cell.newsDescriptionLbl.text = newsDescriptions[indexPath.row]
        cell.newsImage.image = UIImage(named: "newsImg")
        
        return cell
    }
}
