//
//  Comment.swift
//  Lineup
//
//  Created by Hudeifa O on 10/05/2020.
//  Copyright © 2020 Lineup. All rights reserved.
//

import Foundation
import Firebase

protocol DocumentSerializable1 {
    init?(dictionary:[String:Any])
    
}



struct Comment {
    var text: String
    var timeStamp: Date
    
    
    var dictionary:[String:Any] {
        return [
            "text": text,
            "timeStamp": timeStamp
        ]
    }
}


extension Comment: DocumentSerializable1 {
    
    init?(dictionary:[String:Any]) {
        
        guard let text = dictionary["text"] as? String,
        let timeStamp = dictionary["timeStamp"] as? Timestamp else {return nil}
        
        self.init(text: text, timeStamp: timeStamp.dateValue())
    }
    
    
    private init?(documentID: String, dictionary: [String: Any]) {
        guard let text = dictionary["text"] as? String,
        let timeStamp = dictionary["timeStamp"] as? Timestamp else { return nil }
                
        self.init(text: text, timeStamp: timeStamp.dateValue())
    }
    
    init?(document: QueryDocumentSnapshot) {
        self.init(documentID: document.documentID, dictionary: document.data())
    }
    
    init?(document: DocumentSnapshot) {
        guard let data = document.data() else { return nil }
        self.init(documentID: document.documentID, dictionary: data)
    }
    
    var documentData: [String: Any] {
        return [
            "text": text,
            "timeStamp": timeStamp
        ]
    }
    
}







