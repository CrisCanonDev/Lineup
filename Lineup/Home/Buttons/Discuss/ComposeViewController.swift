//
//  ComposeViewController.swift
//  Lineup
//
//  Created by Hudeifa O on 14/05/2020.
//  Copyright © 2020 Lineup. All rights reserved.
//

import UIKit
import Firebase

class ComposeViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        
        textView.text = "What's happening?"
        textView.textColor = UIColor.lightGray
        textView.delegate = self
        

    }
    @IBOutlet weak var postButton: UIBarButtonItem!
    
    @IBOutlet weak var textView: UITextView!
    
    var db: Firestore!

    @IBAction func cancelButton(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func addComment(_ sender: Any) {
        


        if let text = textView.text {
                
            let newComment = Comment(text: text, timeStamp: Date())
                
                var ref:DocumentReference? = nil
                ref = self.db.collection("comments").addDocument(data: newComment.dictionary) {
                    error in
                    
                    if let error = error {
                        print("Error adding document: \(error.localizedDescription)")
                    }
                    
                }
                
            }
        
        presentingViewController?.dismiss(animated: true, completion: nil)

            
        }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "What's happening?"
            textView.textColor = UIColor.lightGray
        }
    }
    
}
