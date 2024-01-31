//
//  Team.swift
//  Lineup
//
//  Created by Hudeifa O on 28/12/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import Foundation

struct Team {
    let id: Int
    let name: String
    let position: Int?
    let points: Int?
    let playedGames: Int?
    
    init?(dict: [String: AnyObject]) {
        guard let teamDict = dict["team"] as? [String: AnyObject] else {
            return nil
        }
        guard let position = dict["position"] as? Int,
            let id = teamDict["id"] as? Int,
            let name = teamDict["name"] as? String,
            let points = dict["points"] as? Int,
            let playedGames = dict["playedGames"] as? Int
                else {
                    return nil
        }

        self.id = id
        self.name = name
        self.position = position
        self.points = points
        self.playedGames = playedGames

    }
    
    
    
}
