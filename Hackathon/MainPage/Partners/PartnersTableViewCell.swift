//
//  PartnersTableViewCell.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/14/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class PartnersTableViewCell: UITableViewCell //UICollectionViewDelegate, UICollectionViewDataSource
{
   
    @IBOutlet weak var partnersLbl: UILabel!
    @IBOutlet weak var partnersCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
//        partnersCollectionView.delegate = self
//        partnersCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
    
}
//extension PartnersTableViewCell {
//    func setCollectionViewDataSourceDelegate
//        <D: UICollectionViewDataSource & UICollectionViewDelegate>
//        (dataSourceDelegate: D, forRow row: Int) {
//
//        partnersCollectionView.delegate = dataSourceDelegate
//        partnersCollectionView.dataSource = dataSourceDelegate
//        partnersCollectionView.tag = row
//        partnersCollectionView.reloadData()
//    }
//}

