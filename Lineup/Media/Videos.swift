//
//  Videos.swift
//  Lineup
//
//  Created by Hudeifa O on 22/09/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
protocol DocumentSerializablee {
    init?(dictionary:[String:Any])
    
}
struct Videos {
    var title: String
    var link: String
    var userLabel: String
    var photoURL: URL
    var embedYT: URL
    var tweetLink: String
    


    var dictionary: [String:Any] {
        
        return [
            "title": title,
            "link": link,
            "userLabel": userLabel,
            "photoURL": photoURL.absoluteString,
            "embedYT": embedYT.absoluteString,
            "tweetLink": tweetLink

        ]
    }
    
}

extension Videos: DocumentSerializablee {
    init?(dictionary: [String : Any]) {
        guard let title = dictionary["title"] as? String,
            let link = dictionary["link"] as? String,
            let userLabel = dictionary["userLabel"] as? String,
            let photoURL = dictionary["photoURL"]as? URL,
            let embedYT = dictionary["embedYT"] as? URL,
            let tweetLink = dictionary["tweetLink"] as? String else { return nil }

        
        self.init(title: title, link: link, userLabel: userLabel, photoURL: photoURL, embedYT: embedYT, tweetLink: tweetLink)
        
    }
    
    
    private init?(documentID: String, dictionary: [String: Any]) {
        guard let title = dictionary["title"] as? String,
            let link = dictionary["link"] as? String,
            let userLabel = dictionary["userLabel"] as? String,
            let photoURLString = dictionary["photoURL"] as? String,
            let embedYTString = dictionary["embedYT"] as? String,
            let tweetLink = dictionary["tweetLink"] as? String else { return nil }

        
        guard let photoURL = URL(string: photoURLString) else { return nil }
        guard let embedYT = URL(string: embedYTString) else { return nil }


        self.init(
            title: title,
            link:  link,
            userLabel: userLabel,
            photoURL: photoURL,
            embedYT: embedYT,
            tweetLink: tweetLink)
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
            "title": title,
            "link": link,
            "userLabel": userLabel,
            "photoURL": photoURL,
            "embedYT": embedYT,
            "tweetLink": tweetLink
        ]
    }
    
    
}


