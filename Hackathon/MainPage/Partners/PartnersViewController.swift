//
//  PartnersViewController.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/14/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class PartnersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
 
    
    @IBOutlet weak var partnersTableView: UITableView!

    
    let partnersDictionary = ["Sponsors": ["ArabMoney", "Rakuten"], "Partners": ["Fly Emirates", "AIG", "Yokohama", "Shoro", "Nashe"], "Organizers": ["Neobis", "MadDevs"]]
   
    let partnersSponsors = [["ArabMoney", "Rakuten"], ["Fly Emirates", "AIG", "Yokohama", "Shoro", "Nashe"], ["Neobis", "MadDevs"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        partnersTableView.rowHeight = UITableViewAutomaticDimension
//        partnersTableView.estimatedRowHeight = 100
        partnersTableView.tableFooterView = UIView()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return partnersSponsors.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partnersSponsors[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = partnersTableView.dequeueReusableCell(withIdentifier: "partnersTableViewCellID") as! PartnersTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? PartnersTableViewCell else { return }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
    
}
extension PartnersViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return partnersSponsors[collectionView.tag].count
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "partnersCollectionViewCellID", for: indexPath) as! PartnersCollectionViewCell
        cell.partnersLabel.text = partnersSponsors[collectionView.tag][indexPath.item]
        print(indexPath.item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.width
        let cellWidth = (width - 100) / 3
        return CGSize(width: cellWidth, height: cellWidth)
    }
}
