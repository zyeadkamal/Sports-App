//
//  FavouritsViewController.swift
//  Sports App
//
//  Created by mac on 1/30/22.
//  Copyright © 2022 mac. All rights reserved.
//

import UIKit


protocol FavoritesViewProtocol
{
    func reloadCollectionView()
}


class FavouritsViewController: UIViewController {
    
    //MARK:- Variables
    var presenter : FavoritesPresenterProtocol?
    
    //MARK:- Outlets
    @IBOutlet weak var favouritsCollectionView: UICollectionView!
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        favouritsCollectionView.delegate = self
        favouritsCollectionView.dataSource = self
        //presenter = FavoritesPresenter(view : self)
        //reloadCollectionView()
        print("m7maaaaaa")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter = FavoritesPresenter(view : self)
        reloadCollectionView()
        print("m7maaaaaa")
    }
}


extension FavouritsViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, FavoritesViewProtocol{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getLeaguesCount() ?? 6
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavouritsCollectionViewCell", for: indexPath) as! FavouritsCollectionViewCell
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 3, height: 3)
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.3
        cell.layer.masksToBounds = false
        
        cell.configure(presenter?.getLeagueAt(index: indexPath.row) ?? FavoriteLeague())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 5, bottom: 1, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (favouritsCollectionView.frame.width - 30 ) , height: favouritsCollectionView.frame.width / 3)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationVC = self.storyboard?.instantiateViewController(identifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
        
        let presenter = LeagueDetalisPresenter(view: destinationVC, APIKey: self.presenter?.getLeagueAt(index: indexPath.row) ?? FavoriteLeague())
        destinationVC.presenter = presenter
        self.present(destinationVC, animated: true, completion: nil)
    }
    
    func reloadCollectionView()
    {
        favouritsCollectionView.reloadData()
    }
    
    
}
