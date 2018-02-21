//
//  PartnersTableViewCell.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class PartnersTableViewCell: UITableViewCell {

    @IBOutlet weak var partnersCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        
        partnersCollectionView.delegate = dataSourceDelegate
        partnersCollectionView.dataSource = dataSourceDelegate
        partnersCollectionView.tag = row
        partnersCollectionView.reloadData()
        
    }
    
}

