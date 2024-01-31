//
//  Post.swift
//  Lineup
//
//  Created by Hudeifa O on 23/04/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage


protocol DocumentSerializable {
    init?(dictionary:[String:Any])

}

extension Firestore {
    var posts: CollectionReference {
      return self.collection("posts")
    }
}


struct Post {
    var name: String
    var content: String
    var photoURL: URL
    var content2: String
    var videoLink: String
    var embed: String
    var detailPhotoURL: URL
    var cvURL: URL
    var timeStamp: Date
    var source: String

    var dictionary: [String:Any] {
        
        return [
            "name": name,
            "content": content,
            "photoURL": photoURL.absoluteString,
            "content2": content2,
            "videoLink": videoLink,
            "embed": embed,
            "detailPhotoURL": detailPhotoURL.absoluteString,
            "cvURL": cvURL.absoluteString,
            "timeStamp": timeStamp,
            "source": source

        ]
    }
    
}

extension Post: DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let name = dictionary["name"] as? String,
        let content = dictionary["content"] as? String,
        let photoURL = dictionary["photoURL"]as? URL,
        let content2 = dictionary["content2"] as? String,
        let videoLink = dictionary["videoLink"] as? String,
        let embed = dictionary["embed"] as? String,
        let detailPhotoURL = dictionary["detailPhotoURL"] as? URL,
        let cvURL = dictionary["cvURL"] as? URL,
        let timeStamp = dictionary["timeStamp"] as? Timestamp,
        let source = dictionary["source"] as? String else {return nil}

        self.init(name: name, content: content, photoURL: photoURL, content2: content2, videoLink: videoLink, embed: embed, detailPhotoURL: detailPhotoURL, cvURL: cvURL, timeStamp: timeStamp.dateValue(), source: source)

    }

    
    private init?(documentID: String, dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String,
            let content = dictionary["content"] as? String,
            let photoURLString = dictionary["photoURL"] as? String,
            let content2 = dictionary["content2"] as? String,
            let videoLink = dictionary["videoLink"] as? String,
            let embed = dictionary["embed"] as? String,
            let detailPhotoURLString = dictionary["detailPhotoURL"] as? String,
            let cvURLString = dictionary["cvURL"] as? String,
            let timeStamp = dictionary["timeStamp"] as? Timestamp,
            let source = dictionary["source"] as? String else {return nil}


        guard let photoURL = URL(string: photoURLString) else { return nil }
        
        guard let detailPhotoURL = URL(string: detailPhotoURLString) else { return nil }
        
        guard let cvURL = URL(string: cvURLString) else { return nil }
        
        
        
        self.init(name: name,
            content:  content,
            photoURL: photoURL,
            content2: content2,
            videoLink: videoLink,
            embed: embed,
            detailPhotoURL: detailPhotoURL,
            cvURL: cvURL,
            timeStamp: timeStamp.dateValue(),
            source: source)
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
            "name": name,
            "content": content,
            "photoURL": photoURL.absoluteString,
            "content2": content2,
            "videoLink": videoLink,
            "embed": embed,
            "detailPhotoURL": detailPhotoURL.absoluteString,
            "cvURL": cvURL.absoluteString,
            "timeStamp": timeStamp,
            "source": source
        ]
    }
        
    
}






