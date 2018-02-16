//
//  BackTableVC.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/7/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class BackTableVC: UITableViewController {

    private let tableArray = ["расписание", "о хакатоне" , "новости и объявления" , "лайфхаки" , "спонсоры" ,
                              "менторы" , "вопросы и ответы" , "правила поведения и участия" , "списки команд" , "отзывы", "о приложении"]
    
    private let vcs = ["ScheduleVC" , "AboutHackVC" , "NewsVC" , "LifehacksVC" , "PartnersVC" , "MentorsVC" , "QuestionsVC" , "RulesVC" , "TeamsVC" ,  "FeedbackVC" , "AboutAppVC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return tableArray.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = tableArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealVC = revealViewController()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: vcs[indexPath.row])
        revealVC?.pushFrontViewController(vc, animated: true)
        
    }
}
