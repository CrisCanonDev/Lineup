//
//  StandingsResponce.swift
//  Lineup
//
//  Created by Hudeifa O on 28/12/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import Foundation

struct StandingsResponce {
    let teams: [Team]
    
    init(json: Any) throws {
        guard let dictionary = json as? [String: AnyObject] else {
            throw
            AppError.noInternetConnection
        }
        guard let standing = (dictionary["standings"] as? [[String: AnyObject]])?.first else {
            throw
            AppError.incorrectDataFormat
        }
        guard let table = standing["table"] as? [[String: AnyObject]] else {
            throw
            AppError.incorrectDataFormat
        }
        
        var teams = [Team]()
        for dictionary in table {
            guard let team = Team(dict: dictionary) else {
                continue
            }
            teams.append(team)
        }
        self.teams = teams
    }
}
