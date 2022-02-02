//
//  ClubDetailsViewController.swift
//  Sports App
//
//  Created by mac on 2/1/22.
//  Copyright © 2022 mac. All rights reserved.
//

import UIKit

class ClubDetailsViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var logoAndKitView: UIView!
    @IBOutlet weak var clubDetailsView: UIView!
    @IBOutlet weak var officialWebsitButton: UIButton!
    @IBOutlet weak var facebookLogo: UIImageView!
    @IBOutlet weak var twitterLogo: UIImageView!
    @IBOutlet weak var stadiumView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateBackgroundViewLayout()
        updateLogoAndKitViewLayout()
        updateClubDetailsViewLayout()
        updateFacebookTwitterLayout()
        updateWebsiteButtonLayout()
        updateStadiumViewLayout()
        
    }
    
    func updateFacebookTwitterLayout(){
        facebookLogo.layer.cornerRadius = 15
        facebookLogo.layer.masksToBounds = true
        twitterLogo.layer.cornerRadius = 15
        twitterLogo.layer.masksToBounds = true
        
    }
    
    func updateWebsiteButtonLayout(){
        officialWebsitButton.layer.cornerRadius = 15
        officialWebsitButton.layer.masksToBounds = true
        
    }
    
    func updateStadiumViewLayout(){
        stadiumView.layer.cornerRadius = 15
        stadiumView.layer.masksToBounds = true
        
    }
    
    func updateBackgroundViewLayout(){        
        backgroundView.layer.cornerRadius = 15
        backgroundView.layer.masksToBounds = true
        backgroundView.layer.shadowColor = UIColor.black.cgColor
        backgroundView.layer.shadowOffset = CGSize(width: 3, height: 3)
        backgroundView.layer.shadowRadius = 4
        backgroundView.layer.shadowOpacity = 0.3
    }
    
    func updateLogoAndKitViewLayout(){
        logoAndKitView.layer.cornerRadius = 30
        logoAndKitView.layer.masksToBounds = false
        logoAndKitView.layer.shadowColor = UIColor.black.cgColor
        logoAndKitView.layer.shadowOffset = CGSize(width: 3, height: 3)
        logoAndKitView.layer.shadowRadius = 4
        logoAndKitView.layer.shadowOpacity = 0.3
    }
    
    func updateClubDetailsViewLayout(){
        clubDetailsView.layer.cornerRadius = 30
        clubDetailsView.layer.masksToBounds = false
        clubDetailsView.layer.shadowColor = UIColor.black.cgColor
        clubDetailsView.layer.shadowOffset = CGSize(width: 3, height: 3)
        clubDetailsView.layer.shadowRadius = 4
        clubDetailsView.layer.shadowOpacity = 0.3
    }
    
    
}
