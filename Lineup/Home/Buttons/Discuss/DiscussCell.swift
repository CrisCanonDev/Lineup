//
//  DiscussCell.swift
//  Lineup
//
//  Created by Hudeifa O on 11/05/2020.
//  Copyright © 2020 Lineup. All rights reserved.
//

import UIKit
import Firebase

class DiscussCell: UITableViewCell {

    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    var comment: Comment!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func populate(comment: Comment) {
        commentLabel.text = comment.text
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, hh:mm"
        let timestamp = formatter.string(from: comment.timeStamp)
        timeLabel.text = timestamp
        
        }
    
    

    
    
}


