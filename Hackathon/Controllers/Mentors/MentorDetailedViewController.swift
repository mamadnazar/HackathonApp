//
//  MentorDetailedViewController.swift
//  Hackathon
//
//  Created by Sanira Madzhikova on 3/10/18.
//  Copyright © 2018 neobis. All rights reserved.
//

//import UIKit
//
//class MentorDetailedViewController: UIViewController {
//
//    @IBOutlet weak var tableView: UITableView!
//    var mentor  = Mentor()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
//}
//
//extension MentorDetailedViewController: UITableViewDataSource, UITableViewDelegate {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 { return 1 }
//        
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if TeamInfoSection(rawValue: indexPath.section) == .about {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell") as! TeamTableViewCell
//            cell.setData(team)
//            return cell
//        }
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell") as! TeamMemberTableViewCell
//        cell.setData(team.members.array[indexPath.row])
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 1 {
//            return "Контакты и соц. сети"
//        }
//    }
//    
//}

