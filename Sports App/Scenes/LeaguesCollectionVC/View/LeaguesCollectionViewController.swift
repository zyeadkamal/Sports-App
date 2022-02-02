//
//  LeaguesCollectionViewController.swift
//  Sports App
//
//  Created by mac on 1/30/22.
//  Copyright © 2022 mac. All rights reserved.
//

import UIKit
import Kingfisher

//private let reuseIdentifier = "Cell"

class LeaguesCollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {
    
    
    var presenter : LeaguePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = LeaguePresenter(view: self)
        
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getAllLeaguesCount() ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeaguesCollectionViewCell", for: indexPath) as! LeaguesCollectionViewCell
        
        // Configure the cell
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 3, height: 3)
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.3
        cell.layer.masksToBounds = false
        cell.leagueVideoButtonPressed = {print("video \(indexPath.row)") }
        let url = URL(string: presenter?.getDataAtIndex(ATIndex: indexPath)?.strBadge ?? "")
        cell.leagueBadgeImage.kf.setImage(with:url)
        cell.leagueNameLebel.text = presenter?.getDataAtIndex(ATIndex: indexPath)?.strLeague
        

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.width - 30 ) , height: collectionView.frame.width / 4 )
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("League \(indexPath.row)")
    }
    
}

extension LeaguesCollectionViewController : ViewToPresenterDelegate{
    func reloadCollectionViewData() {
        self.collectionView.reloadData()
    }
    
    
}
