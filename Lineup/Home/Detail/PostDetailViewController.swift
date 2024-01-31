//
//  PostDetailViewController.swift
//  Lineup
//
//  Created by Hudeifa O on 23/08/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import UIKit
import SDWebImage
import FirebaseFirestore
import Firebase
import AVFoundation
import AVKit
import WebKit
import GoogleMobileAds


class PostDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GADBannerViewDelegate, WKNavigationDelegate {
        
    private var post: Post!
    var postArray = [Post]()
    
    
    static func fromStoryboard(_ storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil),
                               post: Post) -> PostDetailViewController {
        let controller =
            storyboard.instantiateViewController(withIdentifier: "PostDetailViewController")
                as! PostDetailViewController
        controller.post = post
        return controller
    }
    
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var DetailtitleView: DetailTitleView!
    @IBOutlet weak var copyrightLabel: UILabel!
    
let DetailImageCelll = DetailImageCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never

        self.title = post.name
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65.0
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        
        copyrightLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)

    }
    

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DetailtitleView.populate(post: post)
        

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailFirstTextCell.self), for: indexPath) as! DetailFirstTextCell

            cell.populate(post: post)
            
            cell.selectionStyle = .none

            
            return cell
        case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SourceCell.self), for: indexPath) as! SourceCell

                cell.populateSource(post: post)
                
                cell.selectionStyle = .none

                
                return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! DetailFirstTextCell
            
            cell.populateText(post: post)
            
            cell.selectionStyle = .none

            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WebCell", for: indexPath) as! DetailWebCell
            
            let embedCode = post.embed
            cell.detailWebView.loadHTMLString(embedCode, baseURL: nil)
            cell.detailWebView.navigationDelegate = self

            cell.selectionStyle = .none

            return cell
        case 4:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! DetailImageCell
            
            cell.populate(post: post)

            cell.selectionStyle = .none

            return cell
            
        case 5:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell2", for: indexPath) as! DetailFirstTextCell
            
            cell.populateText2(post: post)
            
            cell.selectionStyle = .none
            
            return cell
            
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdCell", for: indexPath) as! DetailAdCell
            
            cell.bannerView.adUnitID = "Your_ID"
            cell.bannerView.rootViewController = self
            cell.bannerView.load(GADRequest())
            cell.bannerView.delegate = self

            cell.selectionStyle = .none

            return cell
        default:
            fatalError()
        }
    }
    
    
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let source =  String(describing: post.source)
            if source == "" {
                cell.isHidden = true

            }
        }
        
        if indexPath.row == 2 {
            let content =  String(describing: post.content)
            if content == "" {
                cell.isHidden = true

            }
        }
        if indexPath.row == 3 {
            let embed =  String(describing: post.embed)
            
            if embed == "" {
                cell.isHidden = true

            }
        }
        
        if indexPath.row == 4 {
            let photoURL =  String(describing: post.detailPhotoURL)
            if photoURL == "0" {
                cell.isHidden = true

            }
        }
        
        if indexPath.row == 5 {
            let content2 =  String(describing: post.content2)
            if content2 == "" {
                cell.isHidden = true

            }
        }
        
        
    }

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let source =  String(describing: post.source)

         if indexPath.row == 1 {
             if source == "" {
             return 0
             }
         }
        
        let content =  String(describing: post.content)

        if indexPath.row == 2 {
            if content == "" {
            return 0
            }
        }
        
        let photoURL =  String(describing: post.detailPhotoURL)

        if indexPath.row == 4 {
            if photoURL == "0" {
            return 0
            }
        }
        
        
        let embed =  String(describing: post.embed)
        
        if indexPath.row == 3 {
            if embed == "" {
            return 0
            }
        } else {
            let embedCode = post.embed
            let WebCell = DetailWebCell()
            WebCell.detailWebView?.loadHTMLString(embedCode, baseURL: nil)
            return tableView.rowHeight
        }
        
        let content2 =  String(describing: post.content2)

        if indexPath.row == 5 {
            if content2 == "" {
            return 0
            }
        }
        
        return tableView.rowHeight

    }
    
    
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
      if navigationAction.navigationType == .linkActivated  {
        if let url = navigationAction.request.url,
        UIApplication.shared.canOpenURL(url) {
          UIApplication.shared.open(url)
          print(url)
          print("Redirected to browser. No need to open it locally")
          decisionHandler(.cancel)
        } else {
          print("Open it locally")
          decisionHandler(.allow)
          }
      } else {
          print("not a user click")
          decisionHandler(.allow)
         }
    }
    
    

    
}


class DetailTitleView: UIView {
    
    
    @IBOutlet var titleImageView: UIImageView!
    

    func populate(post: Post) {        
        titleImageView.sd_setImage(with: post.photoURL)
    }

    
    
    
    
}

