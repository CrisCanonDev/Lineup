//
//  Match.swift
//  Lineup
//
//  Created by Hudeifa O on 16/12/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import Foundation

struct Match {
    
    let id: Int
    var homeName: String
    var awayName: String
    var homeScore: Int?
    var awayScore: Int?
    let status: String
    let utcDate: String


    init?(dict: [String: AnyObject]) {
    
    guard let homeTeamDict = dict["homeTeam"] as? [String: AnyObject] else {
            return nil
        }
        
    guard let awayTeamDict = dict["awayTeam"] as? [String: AnyObject] else {
                return nil
            }

    guard let scoreDict = dict["score"] as? [String: AnyObject] else {
                        return nil
                    }
            
    guard let fullTimeDict = scoreDict["fullTime"] as? [String: AnyObject] else {
                    return nil
                    }

        
    guard let id = dict["id"] as? Int,
        let homeName = homeTeamDict["name"] as? String,
        let awayName = awayTeamDict["name"] as? String,
        let homeScore = fullTimeDict["homeTeam"] as? Int?,
        let awayScore = fullTimeDict["awayTeam"] as? Int?,
        let status = dict["status"] as? String,
        let date = dict["utcDate"] as? String
    
        else {
            return nil
        }
        
        self.id = id
        self.homeName = homeName
        self.awayName = awayName
        self.homeScore = homeScore
        self.awayScore = awayScore
        self.status = status
        self.utcDate = date

    }
    

        
}








