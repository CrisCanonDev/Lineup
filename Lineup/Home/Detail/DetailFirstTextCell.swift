//
//  DetailFirstTextCell.swift
//  Lineup
//
//  Created by Hudeifa O on 10/09/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import FirebaseFirestore
import Firebase
import WebKit
import AVFoundation
import AVKit
import GoogleMobileAds


class DetailFirstTextCell: UITableViewCell {
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    
    @IBOutlet weak var textView: UILabel!
    
    @IBOutlet weak var textView2: UILabel!
            
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    var post: Post! {
        didSet {
        }
    }
    
    func populate(post: Post) {
        detailTitleLabel.text = post.name
        
    }
    
    
    func populateText(post: Post) {
        
        
        textView.text = post.content


        let newLine = post.content.replacingOccurrences(of: "\\n", with: "\n\n")
        textView.text = newLine
    }
    
    
    func populateText2(post: Post) {
        
        
        textView2.text = post.content2
        
        
        let newLine = post.content2.replacingOccurrences(of: "\\n", with: "\n")
        textView2.text = newLine
    }

}



class DetailWebCell: UITableViewCell {
    

    @IBOutlet weak var detailWebView: WKWebView!
    
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        detailWebView.scrollView.isScrollEnabled = false

    }


    
}



class DetailImageCell: UITableViewCell {
    
    
    @IBOutlet weak var detailImageView: UIImageView!

    func populate(post: Post) {
        
        detailImageView.sd_setImage(with: post.detailPhotoURL)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        detailImageView.sd_cancelCurrentImageLoad()

    }


}

class DetailAdCell: UITableViewCell {
        
    @IBOutlet weak var bannerView: GADBannerView!

}

class SourceCell: UITableViewCell {
    
    @IBOutlet weak var sourceLabel: UILabel!
    
    func populateSource(post: Post) {
        sourceLabel.text = post.source
        
    }
}
