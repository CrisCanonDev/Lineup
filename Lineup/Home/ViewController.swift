//
//  ViewController.swift
//  Lineup
//
//  Created by Hudeifa O on 24/02/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
import SDWebImage
import Firebase
import AVKit
import AVFoundation
import GoogleMobileAds


class ViewController: UIViewController {
    
    var db: Firestore!
    
    private var post: Post!

    var postArray = [Post]()
    var postListener: ListenerRegistration?
    
//    var interstitial: GADInterstitial!
    
    struct Storyboard {
        static let sectionHeaderView = "SectionHeaderView"
    }
    
    @IBOutlet weak var collectionView: UICollectionView!


    
    override func viewDidLoad() {
        super.viewDidLoad()

        db = Firestore.firestore()
        

//        interstitial = GADInterstitial(adUnitID: "Your_ID")
//        interstitial.load(GADRequest())

    }


    
    
    private func startListeningForPosts() {
        let basicQuery = Firestore.firestore().collection("posts").limit(to: 50)
        postListener = basicQuery.addSnapshotListener { (snapshot, error) in
            if let error = error {
                print ("I got an error retrieving posts: \(error)")
                return
            }
            guard let snapshot = snapshot else { return }
            self.postArray = []
            for postDocument in snapshot.documents {
                if let newPost = Post(document: postDocument) {
                    self.postArray.append(newPost)
                }
            }
            self.collectionView.reloadData()
        }
    }
    
    private func stopListeningForPosts() {
        postListener?.remove()
        postListener = nil
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startListeningForPosts()
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopListeningForPosts()
    }
    
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns: CGFloat = 2
        let width = collectionView.frame.size.width
        let xInsets: CGFloat = 8
        let cellSpacing: CGFloat = 20
        
        return CGSize(width: (width/numberOfColumns) - (xInsets + cellSpacing), height: (width * 0.7))
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let width = collectionView.frame.size.width
        
        return CGSize(width: collectionView.frame.size.width, height: (width * 0.225))
    }
    
}



// MARK: Datasource

extension ViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
        
        let post = postArray[indexPath.item]
        
        cell.populate(post: post)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let post = postArray[indexPath.item]
            let controller = PostDetailViewController.fromStoryboard(post: post)
        if post.videoLink == "" {
        self.navigationController?.pushViewController(controller, animated: true)
            
            if ((indexPath.item)==0) {

/*               if (interstitial.isReady) {
                    interstitial.present(fromRootViewController: self)
                    interstitial = createAd()
                }
 */
            }
            
            if ((indexPath.item)==3) {

/*                if (interstitial.isReady) {
                    interstitial.present(fromRootViewController: self)
                    interstitial = createAd()
                }
 */
            }
            
            if ((indexPath.item)==5) {
/*
                if (interstitial.isReady) {
                    interstitial.present(fromRootViewController: self)
                    interstitial = createAd()
                }
 */
            }


        } else {
        
            guard let videoURL = URL(string: post.videoLink)  else {
                return
                    }

            let avPlayer = AVPlayer(url: videoURL)
            let avController = AVPlayerViewController()
            avController.player = avPlayer
        present(avController, animated: true) {
                avPlayer.play()
                NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem, queue: nil) { (_) in
                avPlayer.seek(to: CMTime.zero)
                avPlayer.play()
            }
            }
            
/*            if (interstitial.isReady) {
                interstitial.present(fromRootViewController: avController)
                interstitial = createAd()
                }
*/
        }
        
    }
/*
    func createAd() -> GADInterstitial {
        let inter = GADInterstitial(adUnitID: "Your_ID")
        
        inter.load(GADRequest())
        
        return inter
    }
    */
    
    
    // Section Header View
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Storyboard.sectionHeaderView, for: indexPath) as! SectionHeaderView
        
        return sectionHeaderView
    }





}

