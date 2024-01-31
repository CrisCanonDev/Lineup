//
//  LeaguesTableViewController.swift
//  Lineup
//
//  Created by Hudeifa O on 24/12/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import UIKit

class LeaguesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none

    }
    private static let baseUrl = "https://api.football-data.org/v2/competitions"
    private static var standingLeague = Int()
        private static let token : [String: String] = ["X-Auth-Token" : "Your_Token"]
    private static func makeRequest(from url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue(LeaguesTableViewController.token.values.first!, forHTTPHeaderField: LeaguesTableViewController.token.keys.first!)
        return request
    }
    
    static func getTable(completion: @escaping(StandingsResponce)-> Void) {
        
        guard let url = URL(string: "\(baseUrl)/\(standingLeague)/standings") else {
            return
        }
        
        let request = makeRequest(from: url)
        
        NetworkService.shared.fetchData(request: request) { (json) in
            guard let json = json else { return }
            do {
                let response = try StandingsResponce(json: json)
                completion(response)
            } catch {
            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let calendar = Calendar.current
        let rightNow = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd"


        let pDay = calendar.date(byAdding: .day, value: 30, to: rightNow)
        let stringDate = dateFormatter.string(from: pDay!)
        
        
        let mDay = calendar.date(byAdding: .day, value: -2, to: rightNow)
        let stringDate2 = dateFormatter.string(from: mDay!)
        
        
        let date = "dateFrom=\(stringDate2)&dateTo=\(stringDate)"
            
        
        
        let competition = 2021
        let competition2 = 2014
        let competition3 = 2001
        let competition4 = 2002
        let competition5 = 2019
        let competition6 = 2015
        let competition7 = 2018
        let competition8 = 2016
        let competition9 = 2003
        let competition10 = 2013
        let competition11 = 2017

        
        
        if segue.identifier == "showScores" {
            let indexPath = sender as! IndexPath

            guard let dvc = segue.destination as? ScoresViewController else {
                return
            }
            
            
            
            switch indexPath.row {
            case 0:
                
                ScoresNetworkService.getMatch(in: date, for: competition) { (response) in
                        dvc.matches = response.matches
                        dvc.tableView.reloadData()
                    }
                
                    ScoresNetworkService.getMatch2(in: date, for: competition) { (response) in
                        dvc.scores = response.scores
                        dvc.tableView.reloadData()
                }
                
                LeaguesTableViewController.standingLeague = competition
                
            case 1:
                    ScoresNetworkService.getMatch(in: date, for: competition2) { (response) in
                        dvc.matches = response.matches
                        dvc.tableView.reloadData()
                    }
                
                    ScoresNetworkService.getMatch2(in: date, for: competition2) { (response) in
                        dvc.scores = response.scores
                        dvc.tableView.reloadData()
                }
                
                LeaguesTableViewController.standingLeague = competition2
                

            case 2:
                    ScoresNetworkService.getMatch(in: date, for: competition3) { (response) in
                        dvc.matches = response.matches
                        dvc.tableView.reloadData()
                    }
                
                    ScoresNetworkService.getMatch2(in: date, for: competition3) { (response) in
                        dvc.scores = response.scores
                        dvc.tableView.reloadData()
                }
                
                LeaguesTableViewController.standingLeague = competition3
                
            case 3:
                    ScoresNetworkService.getMatch(in: date, for: competition4) { (response) in
                        dvc.matches = response.matches
                        dvc.tableView.reloadData()
                    }
                
                    ScoresNetworkService.getMatch2(in: date, for: competition4) { (response) in
                        dvc.scores = response.scores
                        dvc.tableView.reloadData()
                }
                
                LeaguesTableViewController.standingLeague = competition4
                
            case 4:
                    ScoresNetworkService.getMatch(in: date, for: competition5) { (response) in
                        dvc.matches = response.matches
                        dvc.tableView.reloadData()
                    }
                
                    ScoresNetworkService.getMatch2(in: date, for: competition5) { (response) in
                        dvc.scores = response.scores
                        dvc.tableView.reloadData()
                }
                
                LeaguesTableViewController.standingLeague = competition5
                
            case 5:
                    ScoresNetworkService.getMatch(in: date, for: competition6) { (response) in
                        dvc.matches = response.matches
                        dvc.tableView.reloadData()
                    }
                
                    ScoresNetworkService.getMatch2(in: date, for: competition6) { (response) in
                        dvc.scores = response.scores
                        dvc.tableView.reloadData()
                }
                
                    LeaguesTableViewController.standingLeague = competition6
                
            case 6:
                    ScoresNetworkService.getMatch(in: date, for: competition7) { (response) in
                        dvc.matches = response.matches
                        dvc.tableView.reloadData()
                    }
                
                    ScoresNetworkService.getMatch2(in: date, for: competition7) { (response) in
                        dvc.scores = response.scores
                        dvc.tableView.reloadData()
                }
                

                LeaguesTableViewController.standingLeague = competition7

                
            case 7:
                    ScoresNetworkService.getMatch(in: date, for: competition8) { (response) in
                        dvc.matches = response.matches
                        dvc.tableView.reloadData()
                    }
                
                    ScoresNetworkService.getMatch2(in: date, for: competition8) { (response) in
                        dvc.scores = response.scores
                        dvc.tableView.reloadData()
                }
                
                LeaguesTableViewController.standingLeague = competition8

            case 8:
                    ScoresNetworkService.getMatch(in: date, for: competition9) { (response) in
                        dvc.matches = response.matches
                        dvc.tableView.reloadData()
                    }
                
                    ScoresNetworkService.getMatch2(in: date, for: competition9) { (response) in
                        dvc.scores = response.scores
                        dvc.tableView.reloadData()
                }
                

                LeaguesTableViewController.standingLeague = competition9
                
            case 9:
                    ScoresNetworkService.getMatch(in: date, for: competition10) { (response) in
                        dvc.matches = response.matches
                        dvc.tableView.reloadData()
                    }
                
                    ScoresNetworkService.getMatch2(in: date, for: competition10) { (response) in
                        dvc.scores = response.scores
                        dvc.tableView.reloadData()
                }
                

                LeaguesTableViewController.standingLeague = competition10

            case 10:
                    ScoresNetworkService.getMatch(in: date, for: competition11) { (response) in
                        dvc.matches = response.matches
                        dvc.tableView.reloadData()
                    }
                
                    ScoresNetworkService.getMatch2(in: date, for: competition11) { (response) in
                        dvc.scores = response.scores
                        dvc.tableView.reloadData()
                }
                

                LeaguesTableViewController.standingLeague = competition11
            
            default:
                break
            }


        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            cell.selectionStyle = .none
        
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            cell.selectionStyle = .none
        
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
            cell.selectionStyle = .none
        
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath)
            cell.selectionStyle = .none
        
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell5", for: indexPath)
            cell.selectionStyle = .none
        
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell6", for: indexPath)
            cell.selectionStyle = .none
        
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell7", for: indexPath)
            cell.selectionStyle = .none
        
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell8", for: indexPath)
            cell.selectionStyle = .none
        
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell9", for: indexPath)
            cell.selectionStyle = .none
        
            return cell
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell10", for: indexPath)
            cell.selectionStyle = .none
        
            return cell
        case 10:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell11", for: indexPath)
            cell.selectionStyle = .none
        
            return cell
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                    performSegue(withIdentifier: "showScores", sender: indexPath)

    }
    

}
