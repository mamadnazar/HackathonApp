//
//  ScheduleDataCollectionViewCell.swift
//  Hackathon
//
//  Created by Khasanza on 3/7/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class ScheduleDataCollectionViewCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var scheduleTableView: UITableView!
    var schedules = Schedules()
    override func awakeFromNib() {
        scheduleTableView.tableFooterView = UIView()
        scheduleTableView.dataSource = self
        scheduleTableView.delegate = self
    }
    func fillCell(schedules: Schedules) {
        self.schedules = schedules
        scheduleTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedules.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleDataTableViewCellID") as! MainScheduleTableViewCell
        cell.scheduleDateLabel.text = schedules.array[indexPath.row].start_time
        cell.scheduleLocationLabel.text = schedules.array[indexPath.row].location
        cell.scheduleTitleLabel.text = schedules.array[indexPath.row].title
        return cell
    }
    
}


