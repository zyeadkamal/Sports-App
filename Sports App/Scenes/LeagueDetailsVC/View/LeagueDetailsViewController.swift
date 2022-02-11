//
//  LeagueDetailsViewController.swift
//  Sports App
//
//  Created by mac on 1/30/22.
//  Copyright © 2022 mac. All rights reserved.
//

import UIKit
import Kingfisher

class LeagueDetailsViewController: UIViewController {
    
    @IBOutlet weak var favouritButton: UIButton!
    @IBOutlet weak var liveMatchesCollectionView: UICollectionView!
    
    @IBOutlet weak var nextMatchesCollectionView: UICollectionView!
    
    @IBOutlet weak var leagueClubsCollectionView: UICollectionView!
    
    var presenter : LeagueDetalisPresenterProtocol?
    
    var flag : Bool = false
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Flag = \(flag)")
        flag = presenter?.getFlag() ?? false
        configureUI()
        print("Flag = \(flag)")
    }

    
    @IBAction func favouritButtonPressed(_ sender: UIButton) {
        
        switchBarButtonItem(button: sender)

    }
    
    
    
    func configureUI()
    {
        if (flag)
        {
            favouritButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        else
        {
            favouritButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    func switchBarButtonItem(button : UIButton ){
    
        //flag = !flag
        switch flag {
        case true:
            presenter?.deleteFromDatabase(!flag)
            favouritButton.setImage(UIImage(systemName: "heart"), for: .normal)
            break
        case false:
            
            presenter?.addToDatabase(!flag)
            favouritButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            break
        }
        flag = !flag
    }
    
    
}


extension LeagueDetailsViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case liveMatchesCollectionView:
            return self.presenter?.getAllEventsCount() ?? 0
        case nextMatchesCollectionView:
            return self.presenter?.getAllEventsCount() ?? 0
        case leagueClubsCollectionView:
            return self.presenter?.getAllClubsCount() ?? 0
        default:
            return 6
        }
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
            cell.homeTeamNameLabel.text = presenter?.getAllEvents(atIndex: indexPath)?.strHomeTeam
            cell.hometeamScoreLabel.text = presenter?.getAllEvents(atIndex: indexPath)?.intHomeScore
            cell.awayTeamNameLebel.text = presenter?.getAllEvents(atIndex: indexPath)?.strAwayTeam
            cell.awayTeamScoreLabel.text = presenter?.getAllEvents(atIndex: indexPath)?.intAwayScore
            cell.leagueNameLabel.text = presenter?.getAllEvents(atIndex: indexPath)?.strLeague
            cell.roundLabel.text = "Week \(presenter?.getAllEvents(atIndex: indexPath)?.intRound ?? "2")"
            
            return cell
        case nextMatchesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MatchesCollectionViewCell", for: indexPath) as! MatchesCollectionViewCell
            
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 2, height: 2)
            cell.layer.shadowRadius = 4
            cell.layer.shadowOpacity = 0.3
            cell.layer.masksToBounds = false
            cell.homeTeamNameLabel.text = presenter?.getAllEvents(atIndex: indexPath)?.strHomeTeam
            cell.awayTeamNameLabel.text = presenter?.getAllEvents(atIndex: indexPath)?.strAwayTeam
            cell.matchTimeLabel.text = presenter?.getAllEvents(atIndex: indexPath)?.dateEvent
            
            
            return cell
        case leagueClubsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeagueClubsCollectionViewCell", for: indexPath) as! LeagueClubsCollectionViewCell
            
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 3, height: 3)
            cell.layer.shadowRadius = 4
            cell.layer.shadowOpacity = 0.3
            cell.layer.masksToBounds = false
            
            let url = URL(string: presenter?.getAllClubs(atIndex: indexPath)?.strTeamBadge ?? "")
            cell.clubImage.kf.setImage(with: url)
            cell.clubNameLabel.text = presenter?.getAllClubs(atIndex: indexPath)?.strTeam
            
            
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
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case leagueClubsCollectionView:
            let desVC = self.storyboard?.instantiateViewController(identifier: "ClubDetailsViewController") as! ClubDetailsViewController
            let presenter = ClubDetailsPresenter(club: self.presenter?.getAllClubs(atIndex: indexPath) ?? Team())
            desVC.presenter = presenter
            self.present(desVC, animated: true, completion: nil)
            break
        default:
            break
        }
    }
    
}


extension LeagueDetailsViewController : LeagueDetailsViewToLeagueDetailsPresenterDelegate{
    func reloadliveMatchesCollectionView() {
        self.liveMatchesCollectionView.reloadData()
    }
    
    func reloadnextMatchesCollectionView() {
        self.nextMatchesCollectionView.reloadData()
    }
    
    func reloadleagueClubsCollectionView() {
        self.leagueClubsCollectionView.reloadData()
    }
}
