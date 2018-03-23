
//  MentorDetailedViewController.swift
//  Hackathon
//
//  Created by Sanira Madzhikova on 3/10/18.
//  Copyright © 2018 neobis. All rights reserved.


import UIKit

class MentorDetailedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
            tableView.tableHeaderView = UIView()
        }
    }
    
    var mentorId: Int?
    var mentor = Mentor()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ServerManager.shared.getMentorByID(mentorID: mentorId!, setMentor, error: showErrorAlert)
    }
    
    func setMentor(mentor: Mentor) {
        self.mentor = mentor
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MentorDetailedViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return mentor.contacts.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstSection") as! MentorTableViewCell
            cell.setValues(mentor: mentor)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondSection") as! ContactsTableViewCell
        cell.setValues(contact: mentor.contacts.array[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Контакты и соц. сети"
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat(0)
        } else {
            return CGFloat(44)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let cell = tableView.cellForRow(at: indexPath) as! ContactsTableViewCell
            if cell.typeLabel.text == "Телефон" {
                self.call(data: cell.valueLabel.text!)
            } else if cell.typeLabel.text == "Skype" || cell.typeLabel.text == "E-mail" {
                UIPasteboard.general.string = cell.valueLabel.text!
                let alert = UIAlertController(title: " Cкопировано", message: "", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                self.browser(data: cell.valueLabel.text!)
            }
            
        }
    }
    
    func call(data: String) {
        let temp = returnNumber(number: data)
        if let url = NSURL(string: "telprompt:\(temp)"){
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            } else {
                
            }
        }
    }
    
    func browser(data: String){
        if data.contains("http") {
            UIApplication.shared.openURL(URL(string: data)!)
        } else {
            UIApplication.shared.openURL(URL(string: "http://" + data)!)
        }
    }
    
    func returnNumber(number: String) -> String {
        var ans = [Character]()
        for char in number.characters {
            if ((String(char).rangeOfCharacter(from: CharacterSet.alphanumerics.inverted)) == nil) {
                ans.append(char)
            }
        }
        return String(ans)
    }
    
}

