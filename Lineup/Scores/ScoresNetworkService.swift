//
//  ScoresNetworkService.swift
//  Lineup
//
//  Created by Hudeifa O on 17/12/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import Foundation

class ScoresNetworkService {
    
    private init() {}
        
    private static let baseUrl = "https://api.football-data.org/v2/competitions"

    private static let token : [String: String] = ["X-Auth-Token" : "Your_Token"]

    private static func makeRequest(from url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue(ScoresNetworkService.token.values.first!, forHTTPHeaderField: ScoresNetworkService.token.keys.first!)
        return request
    }
    
    private static let statusArray = "FINISHED%2CIN_PLAY%2CPAUSED"
    private static let statusArray2 = "SCHEDULED%2CPOSTPONED"

    
    
    static func getMatch(in date: String,
                         for competition: Int,

                         completion: @escaping(MatchesResponce)-> Void) {

        guard let url = URL(string: "\(baseUrl)/\(competition)/matches?\(date)&status=\(statusArray)") else {
            return
        }
        
        let request = makeRequest(from: url)
        
        NetworkService.shared.fetchData(request: request) { (json) in
            guard let json = json else { return }
            do {
                let response = try MatchesResponce(json: json)
                completion(response)
            } catch {
            }
        }
        
    }
    
    
    static func getMatch2(in date: String,
                          for competition: Int,

                         completion: @escaping(MatchesResponce2)-> Void) {

        guard let url = URL(string: "\(baseUrl)/\(competition)/matches?\(date)&status=\(statusArray2)") else {
            return
        }
        
        let request = makeRequest(from: url)
        
        NetworkService.shared.fetchData(request: request) { (json) in
            guard let json = json else { return }
            do {
                let response = try MatchesResponce2(json: json)
                completion(response)
            } catch {
            }
        }
        
    }
    
    
    

    
    
    
}
