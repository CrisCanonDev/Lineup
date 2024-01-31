//
//  StandingsCell.swift
//  Lineup
//
//  Created by Hudeifa O on 28/12/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import UIKit

class StandingsCell: UITableViewCell {
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var playedGamesLabel: UILabel!
    @IBOutlet weak var pointslabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure(with team: Team) {
            
            self.positionLabel.text = String(team.position!)
            self.teamLabel.text = String(team.name)
            self.playedGamesLabel.text = String(team.playedGames!)
            self.pointslabel.text = String(team.points!)
            
        }

        


}
