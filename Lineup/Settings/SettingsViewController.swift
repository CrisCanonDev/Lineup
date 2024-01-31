//
//  SettingsViewController.swift
//  Lineup
//
//  Created by Hudeifa O on 25/10/2019.
//  Copyright © 2019 Lineup. All rights reserved.
//

import UIKit
import MessageUI

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.tableFooterView = UIView()

        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactUsCell", for: indexPath)
            
            cell.selectionStyle = .none

            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShareCell", for: indexPath)
                    
            
            cell.selectionStyle = .none

            return cell
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "FollowUsCell", for: indexPath)
            
            
            cell.selectionStyle = .none
            
            return cell
            
        case 3:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ComingCell", for: indexPath)
            
            
            cell.selectionStyle = .none

            return cell
            
            
        default:
            fatalError()
        }

        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if ((indexPath.row)==0) {
            let mailCompose = MFMailComposeViewController()
            mailCompose.mailComposeDelegate = self
            mailCompose.setToRecipients(["lineupfootballapp@gmail.com"])
            mailCompose.setSubject("Feedback")
            mailCompose.setMessageBody("Give us your opinion!", isHTML: false)
            
            if MFMailComposeViewController.canSendMail()
            {
                self.present(mailCompose, animated: true, completion: nil)
            }else{
                print("Error..!")
            }
        }
        
        if ((indexPath.row)==1) {
            let activityController = UIActivityViewController(activityItems: ["Get the latest funny football videos and news on the App Store https://itunes.apple.com/app/id1489043431"], applicationActivities: nil)

            self.present(activityController, animated: true, completion: nil)
        }

    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
