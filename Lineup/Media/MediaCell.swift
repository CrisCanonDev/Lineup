//
//  MediaCell.swift
//  Lineup
//
//  Created by Hudeifa O on 21/09/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import SDWebImage
import WebKit


class MediaCell: UITableViewCell {

    @IBOutlet weak var videoTitleLabel: UILabel!
    
    @IBOutlet weak var videoUserLabel: UILabel!
    
    @IBOutlet weak var playImage: UIImageView!
    
    @IBOutlet weak var videoImageView: UIImageView!
    
    @IBOutlet weak var ytWebView: WKWebView!
    
    @IBOutlet weak var linkButton: UIButton!
    
    
    override open var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 30
            frame.origin.x += 10
            frame.size.height -= 30
            frame.size.width -= 2 * 10
            super.frame = frame
        }
    }
    var openLinkAction: (() -> ())?

         open func aawakeFromNib() {
        super.awakeFromNib()
        
            ytWebView.scrollView.isScrollEnabled = false
            
            self.linkButton.addTarget(self, action: #selector(openLinkTapped(_:)), for: .touchUpInside)

    }
    
    @IBAction func openLinkTapped(_ sender: Any) {
        openLinkAction?()
    }
    
    var video: Videos! {
        didSet {
        }
    }
    
    
    func populate(video: Videos) {
        
        videoTitleLabel.text = video.title
        videoUserLabel.text = video.userLabel
        
        videoImageView.sd_setImage(with: video.photoURL)
        

        let link = video.embedYT
        let request = URLRequest(url: link)
        ytWebView.load(request)
        
        let embed =  String(describing: video.embedYT)

        if embed == "0" {
            ytWebView.isHidden = true
        } else {
            ytWebView.isHidden = false

        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()


        videoImageView.sd_cancelCurrentImageLoad()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    



}

