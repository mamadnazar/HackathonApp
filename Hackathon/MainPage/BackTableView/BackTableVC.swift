//
//  BackTableVC.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class BackTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableArray = ["Расписание","О хакатоне" , "Новости и объявления" , "Лайфхаки" , "Спонсоры" ,
                              "Менторы" , "Вопросы и ответы" , "Правила поведения и участия" , "Списки команд" , "О приложении" , "Отзывы"]
    
    private let vcs = ["ScheduleVC" , "AboutHackathonVC" , "NewsVC" , "LifehacksVC" , "PartnersVC" , "MentorsVC" , "QuestionsVC" , "RulesVC" , "TeamsVC" , "AboutAppVC" ,"FeedbackVC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = tableArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealVC = revealViewController()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: vcs[indexPath.row])
        let nvc = UINavigationController(rootViewController: vc)
        revealVC?.pushFrontViewController(nvc, animated: true)
        
    }
}

