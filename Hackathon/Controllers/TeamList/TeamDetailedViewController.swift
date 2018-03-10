//
//  TeamDetailedViewController.swift
//  Hackathon
//
//  Created by Sanira Madzhikova on 3/10/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class TeamDetailedViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	var team: Team?
	
	enum TeamInfoSection : Int {
		case about = 0
		case members = 1
		
		func getTitle() -> String {
			switch self {
			case .about:
				return "О команде"
			case .members:
				return "Участники"
			}
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
	}
	
}

extension TeamDetailedViewController: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return (team != nil) ? 2 : 0
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if TeamInfoSection(rawValue: section) == .about {
			return 1
		}
		return team?.members.array.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		guard let team = self.team else {
			return UITableViewCell()
		}
		
		if TeamInfoSection(rawValue: indexPath.section) == .about {
			let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell") as! TeamTableViewCell
			cell.setData(team)
			return cell
		}
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell") as! TeamMemberTableViewCell
		cell.setData(team.members.array[indexPath.row])
		return cell
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return TeamInfoSection(rawValue: section)?.getTitle() ?? ""
	}
}
