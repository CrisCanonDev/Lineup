//
//  PostCell.swift
//  Lineup
//
//  Created by Hudeifa O on 05/03/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import SDWebImage
import FirebaseFirestore


class PostCell: UICollectionViewCell {
    
     private var post: Post!


    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
        
    @IBOutlet weak var containsVideoImage: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    

    func populate(post: Post) {
        
        titleLabel.text = post.name
        thumbnailImageView.sd_setImage(with: post.photoURL)
        containsVideoImage.sd_setImage(with: post.cvURL)
        
        timeLabel.text = post.timeStamp.timeAgoDisplay()
    }

    

    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.sd_cancelCurrentImageLoad()
        containsVideoImage.sd_cancelCurrentImageLoad()
    }

        
}

       extension Date {
          func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))

        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day

        if secondsAgo < minute {
            return "\(secondsAgo)s ago"
        } else if secondsAgo < hour {
            return "\(secondsAgo / minute)m ago"
        } else if secondsAgo < day {
            return "\(secondsAgo / hour)h ago"
        } else if secondsAgo < week {
            return "\(secondsAgo / day)d ago"
        }

        return "\(secondsAgo / week)w ago"
    }
}
