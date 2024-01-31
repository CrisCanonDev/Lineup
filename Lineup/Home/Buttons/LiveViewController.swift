//
//  LiveViewController.swift
//  Lineup
//
//  Created by Hudeifa O on 25/10/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import UIKit
import WebKit


class LiveViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let liveURL: URL = URL(string: "https://www.yoursoccerdose.com/")!
        
        let urlRequest: URLRequest = URLRequest(url: liveURL)
        
        webView.load(urlRequest)
        
    }
    
}
