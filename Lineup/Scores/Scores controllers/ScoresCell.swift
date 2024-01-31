//
//  ScoresCell.swift
//  Lineup
//
//  Created by Hudeifa O on 04/12/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import UIKit

class ScoresCell: UITableViewCell {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var awayScoreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    private var match: Match!

    override func awakeFromNib() {
        super.awakeFromNib()
        

    }
    

    
    func configure(with match: Match) {
        if match.status == "IN_PLAY" {
            statusLabel.text = "LIVE"
        }
        if match.status == "PAUSED" {
            statusLabel.text = "HT"
        }
        if match.status == "FINISHED" {
            statusLabel.text = "FT"
        }
        if match.status == "POSTPONED" {
            statusLabel.text = "POSTPND"
        }
        
        homeTeamLabel.text = String(match.homeName)
        awayTeamLabel.text = String(match.awayName)
        homeScoreLabel.text = String(match.homeScore!)
        awayScoreLabel.text = String(match.awayScore!)
        
        let dateString = match.utcDate
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        guard let date = dateFormatter.date(from: dateString) else {
            fatalError()
        }
        dateFormatter.dateFormat = "d.M."
        self.dateLabel.text = dateFormatter.string(from: date)
        
        
    }
    
    
    
}

class ScheduledScoresCell: UITableViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var statusLabel2: UILabel!
    
    @IBOutlet weak var homeTeamLabel2: UILabel!
        
    @IBOutlet weak var awayTeamLabel2: UILabel!
    
    @IBOutlet weak var dateLabel2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()


        cellImageView.layer.borderColor = UIColor(red: 0.98, green: 0.79, blue: 0.30, alpha: 1.0).cgColor
        cellImageView.layer.cornerRadius = 25.0
        cellImageView.layer.borderWidth = 4

    }
    
    
    func populate(with score: Score) {
        homeTeamLabel2.text = String(score.homeName)
        awayTeamLabel2.text = String(score.awayName)
        
        let dateString = score.utcDate
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        guard let date = dateFormatter.date(from: dateString) else {
            fatalError()
        }
        dateFormatter.dateFormat = "HH:mm"
        self.statusLabel2.text = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "d.M."
        self.dateLabel2.text = dateFormatter.string(from: date)
        
        if score.status == "POSTPONED" {
            statusLabel2.text = "POSTPND"
        }
    }
}
