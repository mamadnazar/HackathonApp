//
//  BackTableVC.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class BackTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
	@IBOutlet weak var tableView: UITableView!
	
    private let tableArray = [ "О хакатоне", "Новости и объявления",
							   "Лайфхаки и советы", "Спонсоры и партнеры",
							   "Менторы и жюри", "Расписание",
							   "Вопросы и ответы", "Правила участия", "Списки команд",
							  "Голосование", "Отзывы", "О приложении"]

    private let vcs = ["AboutHackathonVC", "NewsVC",
					   "LifehacksVC", "PartnersVC",
					   "MentorsVC", "ScheduleVC",
					   "QuestionsVC", "RulesVC", "TeamsVC",
					   "VotingVC", "FeedbackVC", "AboutAppVC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.tableFooterView = UIView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return 1
		}
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.section == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "logoHeaderCell", for: indexPath) as UITableViewCell
			return cell
		}
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = tableArray[indexPath.row]
        cell.textLabel?.textColor = Style.Color.darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealVC = revealViewController()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: vcs[indexPath.row])
        let nvc = UINavigationController(rootViewController: vc)
        revealVC?.pushFrontViewController(nvc, animated: true)
        
    }
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.section == 0 {
			return 180
		}
		return 44
	}
}

