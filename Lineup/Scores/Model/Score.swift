//
//  Score.swift
//  Lineup
//
//  Created by Hudeifa O on 22/12/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import Foundation

struct Score {
    
    let id: Int
    var homeName: String
    var awayName: String
    let status: String
    let utcDate: String

    init?(dict: [String: AnyObject]) {
    
    guard let homeTeamDict = dict["homeTeam"] as? [String: AnyObject] else {
            return nil
        }
        
    guard let awayTeamDict = dict["awayTeam"] as? [String: AnyObject] else {
                return nil
            }


        
    guard let id = dict["id"] as? Int,
        let homeName = homeTeamDict["name"] as? String,
        let awayName = awayTeamDict["name"] as? String,
        let status = dict["status"] as? String,
        let date = dict["utcDate"] as? String

        else {
            return nil
        }
        
        self.id = id
        self.homeName = homeName
        self.awayName = awayName
        self.status = status
        self.utcDate = date


    }
    

        
}









