//
//  ScheduleViewController.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/19/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit
import SVProgressHUD

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var scheduleTypes = ScheduleTypes()
    
    @IBOutlet weak var scheduleTableView: UITableView!
    @IBOutlet weak var scheduleCollectionView: UICollectionView!
   
    var isSelected = false
    var selectedCollectionCell = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        self.view.backgroundColor = .black
        self.scheduleTableView.tableFooterView = UIView()
        ServerManager.shared.getScheduleTypes(getSchedules, error: showErrorAlert)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = Constants.schedule
    }
    
    func getSchedules(scheduleTypes: ScheduleTypes) {
        self.scheduleTypes = scheduleTypes
        self.scheduleCollectionView.reloadData()
        self.scheduleTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (isSelected == true) {
            print("numOfRowsInSection", scheduleTypes.array[selectedCollectionCell].events.array.count)
            return scheduleTypes.array[selectedCollectionCell].events.array.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleTableViewCellID", for: indexPath) as! ScheduleTableViewCell
        cell.scheduleTitleLabel.text = scheduleTypes.array[selectedCollectionCell].events.array[indexPath.item].title
        cell.scheduleTimeLabel.text = scheduleTypes.array[selectedCollectionCell].events.array[indexPath.item].start_time
        cell.scheduleLocationLabel.text = scheduleTypes.array[selectedCollectionCell].events.array[indexPath.item].location
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

extension ScheduleViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scheduleTypes.array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scheduleCollectionViewCellID", for: indexPath) as! ScheduleCollectionViewCell
        cell.scheduleDateLabel.text = scheduleTypes.array[indexPath.item].date
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ScheduleCollectionViewCell
        cell.scheduleDateLabel.textColor = UIColor.red
        SVProgressHUD.show()
        UIView.animate(withDuration: 0.5, animations: {
           SVProgressHUD.show()
        }) { (bool) in
            self.scheduleTableView.reloadData()
            SVProgressHUD.dismiss()
        }
        
        isSelected = true
        selectedCollectionCell = indexPath.item
        
    }
    
}



