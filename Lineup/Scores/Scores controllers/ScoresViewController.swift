//
//  ScoresViewController.swift
//  Lineup
//
//  Created by Hudeifa O on 03/12/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import UIKit

class ScoresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var matches = [Match]()
    var scores = [Score]()
    var teams = [Team]()

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65.0
        tableView.separatorStyle = .none

        

    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if scores.count == 0 {
        tableView.setEmptyView(message: "No upcoming matches.")
        }
        else {
        tableView.restore()
        }
            
            switch (section) {
            case 0:
                return matches.count
            case 1:
                return scores.count
            default:
                break
            }
            
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ScoresCell
            let match = matches[indexPath.row]
            cell.configure(with: match)
            
            cell.selectionStyle = .none

            return cell
        case 1:
                
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellScheduled", for: indexPath) as! ScheduledScoresCell
            let score = scores[indexPath.row]
            cell.populate(with: score)
            
            cell.selectionStyle = .none
             
            return cell

            
        default:
            fatalError()
        }
                    
    }


    
}


extension UITableView {
func setEmptyView(message: String) {
let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
let messageLabel = UILabel()
messageLabel.translatesAutoresizingMaskIntoConstraints = false
messageLabel.textColor = UIColor.lightGray
messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
emptyView.addSubview(messageLabel)
messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
    messageLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: 0).isActive = true
messageLabel.text = message
messageLabel.numberOfLines = 0
messageLabel.textAlignment = .center

self.backgroundView = emptyView
self.separatorStyle = .none
    messageLabel.isHidden = true

    DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
        messageLabel.isHidden = false
    }
    }
func restore() {
self.backgroundView = nil
self.separatorStyle = .singleLine
    
    }
}
