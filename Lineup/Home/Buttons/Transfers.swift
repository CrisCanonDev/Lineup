//
//  Transfers.swift
//  Lineup
//
//  Created by Hudeifa O on 23/10/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

protocol DocumentSerializableee {
    init?(dictionary:[String:Any])
    
}

struct Transfers {

    var transferImage: URL
    var dictionary: [String:Any] {
        
        return [

            "transferImage": transferImage.absoluteString,

        ]
    }
    
}

extension Transfers: DocumentSerializableee {
    
    init?(dictionary: [String : Any]) {
        guard let transferImage = dictionary["transferImage"]as? URL else {return nil}
        
        self.init(transferImage: transferImage)
        
    }

    
    private init?(documentID: String, dictionary: [String: Any]) {
        guard let transferImageString = dictionary["transferImage"] as? String else { return nil }
        
        guard let transferImage = URL(string: transferImageString) else { return nil }
        
        self.init(
            transferImage: transferImage
        )
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
            "transferImage": transferImage.absoluteString,
        ]
    }
        
    
}






