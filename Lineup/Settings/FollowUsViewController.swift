//
//  FollowUsViewController.swift
//  Lineup
//
//  Created by Hudeifa O on 05/11/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import UIKit
import WebKit


class FollowUsViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func doneButton(_ sender: Any) {

        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let profileURL: URL = URL(string: "https://twitter.com/lineupftbl")!
        
        let urlRequest: URLRequest = URLRequest(url: profileURL)
        
        webView.load(urlRequest)
        
    }
    
}
