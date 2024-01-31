//
//  NetworkService.swift
//  Lineup
//
//  Created by Hudeifa O on 17/12/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    func fetchData(request: URLRequest, completion: @escaping (Any?) -> Void) {
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async {
                    completion(json)
                }
            } catch {
                completion(nil)
                print("Error in \(#function) at line \(#line): \(error)")
            }
            
        }.resume()
    }
}
