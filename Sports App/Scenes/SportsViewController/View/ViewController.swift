//
//  ViewController.swift
//  Sports App
//
//  Created by mac on 1/29/22.
//  Copyright © 2022 mac. All rights reserved.
//

import UIKit

protocol SportsViewProtocol : AnyObject
{
    func reloadCollectionView()
}
class ViewController: UIViewController {
    
    //MARK:- Variables
    var presenter : SportsPresenterProtocol?
    
    //MARK:- Outlets
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sportsCollectionView.delegate = self
        sportsCollectionView.dataSource = self
        presenter = SportsPresenter(view: self)
        
    }
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SportsViewProtocol{
    
    //MARK:- Confromed Functions
    func reloadCollectionView() {
        sportsCollectionView.reloadData()
    }
    
    
    //MARK:- Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getSportsCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportCollectionViewCell", for: indexPath) as! SportCollectionViewCell
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 3, height: 3)
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.3
        cell.layer.masksToBounds = false
        
        let sport = presenter?.getSportAt(index: indexPath.row)
        cell.setSportLabel(sportName: sport?.strSport ?? "")
        cell.setSportImage(imgPath: sport?.strSportThumb ?? "")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 5, bottom: 1, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (sportsCollectionView.frame.width - 30 ) / 2 , height: sportsCollectionView.frame.width / 3)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationVC = self.storyboard?.instantiateViewController(identifier: "LeaguesCollectionViewController") as! LeaguesCollectionViewController
        let destpresenter = LeaguePresenter(view: destinationVC, APIKey: presenter?.setAPIKey(index: indexPath) ?? "")
        destinationVC.presenter = destpresenter        
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

