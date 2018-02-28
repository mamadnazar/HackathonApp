//
//  TeamListViewController.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/26/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class TeamListViewController: UIViewController {
    
    let listOfTeams = ["Neobis1" , "Neobis2" , "Neobis3" , "Neobis4" ]
    var selectedTeam: Int?
    var isSelected = false
    let teamMembers = [["1" , "2" , "3"],["1" , "3"] , ["1" , "2" , "3" , "4"],["1" , "3" , "5"]]
    
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
        self.title = Constants.teams
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
        listView.center = CGPoint(x: view.bounds.midX, y: 5)
        listView.alpha = 0
        
        
        UIView.animate(withDuration: 0.4) {
            self.listView.alpha = 1
            self.listView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
            
        }
    }
    
    func hideListView() {
        UIView.animate(withDuration: 0.4, animations: {
            self.listView.alpha = 0
            self.listView.center = CGPoint(x: self.view.bounds.midX, y: 5)
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
            if let selected = selectedTeam {
                count = teamMembers[selected].count
            }
            else {
                count = 0
            }
            
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if tableView == listOfTeamsTV {
            cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath)
            cell.textLabel?.text = listOfTeams[indexPath.row]
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            cell.textLabel?.textColor = Style.Color.darkGray
            
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath)
            cell.textLabel?.text = teamMembers[selectedTeam!][indexPath.row]
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            cell.textLabel?.textColor = UIColor.lightGray
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == listOfTeamsTV {
            hideListView()
            isSelected = true
            selectedTeam = indexPath.row
            self.dimissButton.isHidden = true
            btnSelect.setTitle(listOfTeams[indexPath.row], for: .normal)
            teamMembersTV.reloadData()
        }
    }
}

