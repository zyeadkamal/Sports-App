//
//  LeaguesCollectionViewController.swift
//  Sports App
//
//  Created by mac on 1/30/22.
//  Copyright © 2022 mac. All rights reserved.
//

import UIKit
import Kingfisher


class LeaguesCollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {
    
    
    var presenter : LeaguePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Functions
    
    func openURL(_ urlString: String) {
        
        if urlString == "https://"{
            showAlert()
        }else{
            guard let url = URL(string: urlString) else {return}
            UIApplication.shared.open(url, completionHandler: { success in
                if success {
                    print("opened")
                } else {
                    print("failed")
                }
            })
        }
    }
    
    
    func showAlert(){
        
        let alert = UIAlertController(title: "Sorry", message: "There is no YouTube link for this content", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
        cell.leagueVideoButtonPressed = { self.openURL("https://\(self.presenter?.getDataAtIndex(ATIndex: indexPath)?.strYoutube ?? "")")}
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
        let destinationVC = self.storyboard?.instantiateViewController(identifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
        let tmpObject : League = presenter?.getDataAtIndex(ATIndex: indexPath) ?? League()
        
        let leagueToBeSent = FavoriteLeague(strLeague: tmpObject.strLeague, strBadge: tmpObject.strBadge, strYoutube: tmpObject.strYoutube, isFavorite: presenter?.getFlag(tmpObject.strLeague ?? ""))
        let presenter = LeagueDetalisPresenter(view: destinationVC, APIKey: leagueToBeSent)
        destinationVC.presenter = presenter
        
        self.navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    
    
    
    
}

extension LeaguesCollectionViewController : LeagueViewToLeaguePresenterDelegate{
    func reloadCollectionViewData() {
        self.collectionView.reloadData()
    }
}
