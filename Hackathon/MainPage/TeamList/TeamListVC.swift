//
//  TeamListVC.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 neobis. All rights reserved.
//
import UIKit

class TeamListViewController: UIViewController {
    
    let listOfTeams = ["Neobis" , "Neobis1" , "Neobis2" , "Neobis3" , "Neobis4" , "Neobis5" , "Neobis6" , "Neobis7"]
    let teamMembers = ["1" , "2" , "3"]
    
    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet var listView: UIView!
    @IBOutlet weak var dimissButton: UIButton!
    @IBOutlet weak var teamMembersTV: UITableView!
    @IBOutlet weak var listOfTeamsTV: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dimissButton.isHidden = true
        setNavigationBar()
        
        let cn : String = Shared.shared.companyName ?? "Выберите команду"
        btnSelect.setTitle(cn,for: .selected)
        btnSelect.backgroundColor = UIColor.white
        btnSelect.layer.shadowColor = UIColor.lightGray.cgColor
        btnSelect.layer.shadowRadius = 10
        btnSelect.layer.shadowOpacity = 50
        btnSelect.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Список команд"
    }
    
    @IBAction func openTeamListVC(_ sender: UIButton) {
        showListView()
        dimissButton.isHidden = false
    }
    
    @IBAction func closeTeamListVC(_ sender: UIButton) {
        hideListView()
        dimissButton.isHidden = true
    }
    
    
    func showListView() {
        view.addSubview(listView)
        listView.center = CGPoint(x: view.bounds.midX, y: 140)
        listView.alpha = 0
        
        
        UIView.animate(withDuration: 0.4) {
            self.listView.alpha = 1
            self.listView.center = self.view.center
            
        }
    }
    
    func hideListView() {
        UIView.animate(withDuration: 0.4, animations: {
            self.listView.alpha = 0
            self.listView.center = CGPoint(x: self.view.bounds.midX, y: -200)
        }) { (success) in
            self.listView.removeFromSuperview()
        }
    }
    
    
}

extension TeamListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count = 0
        
        if tableView == listOfTeamsTV {
            count = listOfTeams.count
        } else {
            count = teamMembers.count
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if tableView == listOfTeamsTV {
            cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath)
            cell.textLabel?.text = listOfTeams[indexPath.row]
            cell.backgroundColor = .clear
            cell.textLabel?.textColor = UIColor(red: 246/255, green: 85/255, blue: 81/255, alpha: 1)
            
        } else if tableView == teamMembersTV {
            cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath)
            cell.textLabel?.text = teamMembers[indexPath.row]
            cell.backgroundColor = .clear
            cell.textLabel?.textColor = UIColor(red: 246/255, green: 85/255, blue: 81/255, alpha: 1)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        hideListView()
        self.dimissButton.isHidden = true
        btnSelect.titleLabel?.text = listOfTeams[indexPath.row]
        
        let indexPath = IndexPath(row: indexPath.row, section: indexPath.section)
        tableView.cellForRow(at: indexPath)
        tableView.reloadData()
        //tableView(teamMembersTV, numberOfRowsInSection: Int)
        //tableView(teamMembersTV, cellForRowAt: indexPath)
        
    }
    
  
}
