//
//  TransfersViewController.swift
//  Lineup
//
//  Created by Hudeifa O on 23/10/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import SDWebImage


class TransfersViewController: UIViewController {

    var database: Firestore!
    var transferArray = [Transfers]()
    var transferListener: ListenerRegistration?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        database = Firestore.firestore()
        
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func startListeningForTransfers() {
        let basicQuery = Firestore.firestore().collection("transfers").limit(to: 50)
        transferListener = basicQuery.addSnapshotListener { (snapshot, error) in
            if let error = error {
                print ("I got an error retrieving transfers: \(error)")
                return
            }
            guard let snapshot = snapshot else { return }
            self.transferArray = []
            for transferDocument in snapshot.documents {
                if let newTransfer = Transfers(document: transferDocument) {
                    self.transferArray.append(newTransfer)
                }
            }
            self.tableView.reloadData()
        }
    }
    
    private func stopListeningForTransfers() {
        transferListener?.remove()
        transferListener = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startListeningForTransfers()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopListeningForTransfers()

    }
    

}


extension TransfersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transferArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransferCell", for: indexPath) as! TransfersCell
        
        let transfers = transferArray[indexPath.row]

        cell.populate(transfers: transfers)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}



class TransfersCell: UITableViewCell {
    
    @IBOutlet weak var transfersImageView: UIImageView!
    
    var transfers: Transfers! {
        didSet {
        }
    }
    
    func populate(transfers: Transfers) {
        
        transfersImageView.sd_setImage(with: transfers.transferImage) }
        
    override func prepareForReuse() {
        super.prepareForReuse()
        transfersImageView.sd_cancelCurrentImageLoad()
    }
    
    
    
}
