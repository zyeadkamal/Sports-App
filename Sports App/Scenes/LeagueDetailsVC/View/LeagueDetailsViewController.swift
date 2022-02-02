//
//  LeagueDetailsViewController.swift
//  Sports App
//
//  Created by mac on 1/30/22.
//  Copyright © 2022 mac. All rights reserved.
//

import UIKit

class LeagueDetailsViewController: UIViewController {
    
    @IBOutlet weak var liveMatchesCollectionView: UICollectionView!
    
    @IBOutlet weak var nextMatchesCollectionView: UICollectionView!
    
    @IBOutlet weak var leagueClubsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        liveMatchesCollectionView.delegate = self
        liveMatchesCollectionView.dataSource = self
        
        nextMatchesCollectionView.delegate = self
        nextMatchesCollectionView.dataSource = self
        
        leagueClubsCollectionView.delegate = self
        leagueClubsCollectionView.dataSource = self
    }
    
}


extension LeagueDetailsViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case liveMatchesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveMatchesCollectionViewCell", for: indexPath) as! LiveMatchesCollectionViewCell
            
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 3, height: 3)
            cell.layer.shadowRadius = 4
            cell.layer.shadowOpacity = 0.3
            cell.layer.masksToBounds = false
            
            return cell
        case nextMatchesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MatchesCollectionViewCell", for: indexPath) as! MatchesCollectionViewCell
            
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 2, height: 2)
            cell.layer.shadowRadius = 4
            cell.layer.shadowOpacity = 0.3
            cell.layer.masksToBounds = false
            
            return cell
        case leagueClubsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeagueClubsCollectionViewCell", for: indexPath) as! LeagueClubsCollectionViewCell
            
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 3, height: 3)
            cell.layer.shadowRadius = 4
            cell.layer.shadowOpacity = 0.3
            cell.layer.masksToBounds = false
            
            return cell
        default:
            return UICollectionViewCell()
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case liveMatchesCollectionView:
            return CGSize(width: (collectionView.frame.width - 40 ) , height: collectionView.frame.height - 40 )
        case nextMatchesCollectionView:
            return CGSize(width: (collectionView.frame.width - 40 ) , height: collectionView.frame.height / 3.5 )
        case leagueClubsCollectionView:
            return CGSize(width: (collectionView.frame.width / 2 ) , height: collectionView.frame.height - 30 )
        default:
            return CGSize(width: (collectionView.frame.width - 30 ) , height: collectionView.frame.height - 60 )
            
        }
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case liveMatchesCollectionView:
            return 20
        case nextMatchesCollectionView:
            return 25
        case leagueClubsCollectionView:
            return 20
        default:
            return 1
            
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 15, left: 5, bottom: 1, right: 5)
       }
    
}
