//
//  ScheduleViewController.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/19/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var scheduleTypes = ScheduleTypes()
    
//    var schedule_title = ""
//    var schedule_time = ""
//    var schedule_location = ""
    
//    @IBOutlet weak var scheduleSegmentedController: UISegmentedControl!
//    @IBAction func scheduleSegmentedControllerAction(_ sender: Any) {
//        switch scheduleSegmentedController.selectedSegmentIndex
//        {
//        case 0:
//            schedule_title = "Hackathon starts"
//            schedule_location = "AUCA"
//            schedule_time = "9:00"
//        case 1:
//            schedule_title = "Hackathon continues"
//            schedule_location = "AUCA"
//            schedule_time = "8:00"
//        case 2:
//            schedule_title = "Wake up"
//            schedule_location = "G30"
//            schedule_time = "12:00"
//        case 3:
//            schedule_title = "Cho-to"
//            schedule_location = "Gde-to"
//            schedule_time = "Kogda-to"
//        case 4:
//            schedule_title = "Ne"
//            schedule_location = "Nerede"
//            schedule_time = "Ne zaman"
//        default:
//            break
//        }
//    }
    
    @IBOutlet weak var scheduleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        self.view.backgroundColor = .black
        self.scheduleTableView.tableFooterView = UIView()
        ServerManager.shared.getScheduleTypes(getSchedules, error: showErrorAlert)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = Constants.schedule
    }
    
    func getSchedules(scheduleTypes: ScheduleTypes) {
        self.scheduleTypes = scheduleTypes
        self.scheduleTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("numOfSections", scheduleTypes.array.count)
        return scheduleTypes.array.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numOfRowsInSection", scheduleTypes.array[section].events.array.count)
        return scheduleTypes.array[section].events.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleTableViewCellID", for: indexPath) as! ScheduleTableViewCell
//        cell.backgroundColor = .blue
//        cell.textLabel?.text = "dasdasdasd"
        cell.scheduleTitleLabel.text = scheduleTypes.array[indexPath.section].events.array[indexPath.item].title
        cell.scheduleTimeLabel.text = scheduleTypes.array[indexPath.section].events.array[indexPath.item].start_time
        cell.scheduleLocationLabel.text = scheduleTypes.array[indexPath.section].events.array[indexPath.item].location
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
