//
//  MatchesResponce.swift
//  Lineup
//
//  Created by Hudeifa O on 17/12/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import Foundation

struct MatchesResponce {
    
    let matches: [Match]
    
    init(json: Any) throws {
        guard let dictionary = json as? [String: AnyObject] else {
            throw
            AppError.noInternetConnection
        }
        
        guard let match = (dictionary["matches"] as? [[String: AnyObject]]) else {
            throw
            AppError.incorrectDataFormat
        }
        
        var matches = [Match]()
        
        for dictionary in match {
            guard let match = Match(dict: dictionary) else {
                continue
            }
            matches.append(match)
        }
        self.matches = matches
    }

}

struct MatchesResponce2 {
    
    let scores: [Score]
    
    init(json: Any) throws {
        guard let dictionary = json as? [String: AnyObject] else {
            throw
            AppError.noInternetConnection
        }
        
        guard let match = (dictionary["matches"] as? [[String: AnyObject]]) else {
            throw
            AppError.incorrectDataFormat
        }
        
        var scores = [Score]()
        
        for dictionary in match {
            guard let match = Score(dict: dictionary) else {
                continue
            }
            scores.append(match)
        }
        self.scores = scores
    }

}



enum AppError: Error {
    case noInternetConnection
    case incorrectDataFormat
}
