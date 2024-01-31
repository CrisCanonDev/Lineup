//
//  StandingsViewController.swift
//  Lineup
//
//  Created by Hudeifa O on 28/12/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import UIKit

class StandingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var teams = [Team]()
        
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        LeaguesTableViewController.getTable() { (response) in
            
            self.teams = response.teams
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return teams.count + 1

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell")
            return cell!
        } else {
            
        }
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StandingsCell
        
        let teamIndex = indexPath.row - 1

        let team = teams[teamIndex]
        cell.configure(with: team)

        
        return cell
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    

}
