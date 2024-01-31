//
//  MediaViewController.swift
//  Lineup
//
//  Created by Hudeifa O on 21/09/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Firebase
import FirebaseFirestore
import WebKit

class MediaViewController: UIViewController {

    var datab: Firestore!
    var videoArray = [Videos]()
    var videoListener: ListenerRegistration?
    private var videos: Videos!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var Tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityIndicator.startAnimating()
        
        datab = Firestore.firestore()
        
        Tableview.estimatedRowHeight = 250
        Tableview.rowHeight = UITableView.automaticDimension
        

        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        Tableview.contentInset = insets
    }

    private func startListeningForVideos() {
        let basicQuery = Firestore.firestore().collection("videos").limit(to: 50)
        videoListener = basicQuery.addSnapshotListener { (snapshot, error) in
            if let error = error {
                print ("I got an error retrieving videos: \(error)")
                return
            }
            guard let snapshot = snapshot else { return }
            self.videoArray = []
            for videoDocument in snapshot.documents {
                if let newVideo = Videos(document: videoDocument) {
                    self.videoArray.append(newVideo)
                }
            }
            self.Tableview.reloadData()
        }
    }
    
    private func stopListeningForVideos() {
        videoListener?.remove()
        videoListener = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startListeningForVideos()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopListeningForVideos()

    }
    
}

extension MediaViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Tableview.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaCell
        let video = videoArray[indexPath.row]
        
        cell.populate(video: video)
        
        
        
        cell.selectionStyle = .none

        self.activityIndicator.stopAnimating()
        
        self.activityIndicator.alpha = 0
        
        cell.openLinkAction = { [unowned self] in
            let video = self.videoArray[indexPath.row]
            let tweetURL = URL(string: video.tweetLink)!
            UIApplication.shared.open(tweetURL)

        }
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let videoURL = URL(string: videoArray[indexPath.row].link)  else {
            return
        }
        
        let avPlayer = AVPlayer(url: videoURL)
        let avController = AVPlayerViewController()
        avController.player = avPlayer
        
        present(avController, animated: true) {
            avPlayer.play()            
        }


    }
    

}

