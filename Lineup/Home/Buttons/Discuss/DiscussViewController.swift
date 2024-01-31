//
//  DiscussViewController.swift
//  Lineup
//
//  Created by Hudeifa O on 30/04/2020.
//  Copyright © 2020 Lineup. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase


class DiscussViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var db: Firestore!
        
    private var comment: Comment!

    var commentArray = [Comment]()
    var commentListener: ListenerRegistration?
        

    @IBOutlet weak var tableView: UITableView!
    
        
    override func viewDidLoad() {
            super.viewDidLoad()

            db = Firestore.firestore()
            tableView.separatorStyle = .none

            tableView.delegate = self
            tableView.dataSource = self
        
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)

        
        }
        
    
    private func startListeningForComments() {
        let basicQuery = Firestore.firestore().collection("comments").order(by: "timeStamp", descending: true)
        commentListener = basicQuery.addSnapshotListener { (snapshot, error) in
            if let error = error {
                print ("I got an error retrieving comments: \(error)")
                return
            }
            guard let snapshot = snapshot else { return }
            self.commentArray = []
            for commentDocument in snapshot.documents {
                if let newComment = Comment(document: commentDocument) {
                    self.commentArray.append(newComment)
                }
            }
            self.tableView.reloadData()
        }
    }
    
    private func stopListeningForTransfers() {
        commentListener?.remove()
        commentListener = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startListeningForComments()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopListeningForTransfers()

    }
    



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DiscussCell

        let comment = commentArray[indexPath.row]
        
        cell.populate(comment: comment)
        
        return cell
    }

    
        
}
