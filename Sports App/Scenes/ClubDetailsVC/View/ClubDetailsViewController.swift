//
//  ClubDetailsViewController.swift
//  Sports App
//
//  Created by mac on 2/1/22.
//  Copyright © 2022 mac. All rights reserved.
//

import UIKit
import Kingfisher

class ClubDetailsViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var logoAndKitView: UIView!
    @IBOutlet weak var clubDetailsView: UIView!
    @IBOutlet weak var officialWebsitButton: UIButton!
    @IBOutlet weak var facebookLogo: UIImageView!
    @IBOutlet weak var twitterLogo: UIImageView!
    @IBOutlet weak var stadiumView: UIImageView!
    
    @IBOutlet weak var clubImage: UIImageView!
    @IBOutlet weak var formedLabel: UILabel!
    @IBOutlet weak var staduimname: UILabel!
    
    @IBOutlet weak var staduimImage: UIImageView!
    @IBOutlet weak var kitImage: UIImageView!
    var presenter : ClubDetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateBackgroundViewLayout()
        updateLogoAndKitViewLayout()
        updateClubDetailsViewLayout()
        updateFacebookTwitterLayout()
        updateWebsiteButtonLayout()
        updateStadiumViewLayout()
        updateUI()
        
    }
    
    
    func updateUI(){
        
        self.title = presenter?.getClubDetails().strTeam
        let kitUrl = URL(string: presenter?.getClubDetails().strTeamJersey ?? "")
        let logoUrl = URL(string: presenter?.getClubDetails().strTeamBadge ?? "")
        let stadUrl = URL(string: presenter?.getClubDetails().strStadiumThumb ?? "")
        staduimname.text = presenter?.getClubDetails().strStadium
        formedLabel.text = "EST. \(presenter?.getClubDetails().intFormedYear ?? "0")"
        staduimImage.kf.setImage(with: stadUrl)
        kitImage.kf.setImage(with: kitUrl)
        clubImage.kf.setImage(with: logoUrl)


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
