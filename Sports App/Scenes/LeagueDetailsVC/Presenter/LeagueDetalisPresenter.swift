//
//  LeagueDetalisPresenter.swift
//  Sports App
//
//  Created by mac on 2/8/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation

protocol LeagueDetailsViewToLeagueDetailsPresenterDelegate {
    func reloadliveMatchesCollectionView()
    func reloadnextMatchesCollectionView()
    func reloadleagueClubsCollectionView()
    
}


protocol LeagueDetalisPresenterProtocol {
    func getAllEventsCount() -> Int
    func getAllEvents(atIndex : IndexPath) -> Event?
    func getAllClubsCount() -> Int
    func getAllClubs(atIndex : IndexPath) -> Team?
    
}

class LeagueDetalisPresenter : AssignAPIKey {
    
    
    var APIKey: String
    var allEvents : [Event]?
    var allTeams : [Team]?
    var view : LeagueDetailsViewToLeagueDetailsPresenterDelegate
    
    init(view : LeagueDetailsViewToLeagueDetailsPresenterDelegate , APIKey : String) {
        self.view = view
        self.APIKey = APIKey
        fetchEventsDataFromAPI()
        fetchClubsDataFromAPI()
    }
    
    func fetchEventsDataFromAPI(){
        let network = NetworkManager()
        network.request(fromEndpoint: EndPoint.events, parametrs: [:]) { [weak self ](result: Result<AllEvents, Error>) in
            switch result {
            case .success(let response):
                self?.allEvents = response.event
                self?.view.reloadliveMatchesCollectionView()
                self?.view.reloadnextMatchesCollectionView()
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
    func fetchClubsDataFromAPI(){
        let network = NetworkManager()
        network.request(fromEndpoint: EndPoint.allTeams, parametrs: ["l":APIKey]) { [weak self ](result: Result<ListOfTeams, Error>) in
            switch result {
            case .success(let response):
                self?.allTeams = response.teams
                self?.view.reloadleagueClubsCollectionView()
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
}


extension LeagueDetalisPresenter: LeagueDetalisPresenterProtocol {
    func getAllClubsCount() -> Int {
        return self.allTeams?.count ?? 0
        
    }
    
    func getAllClubs(atIndex: IndexPath) -> Team? {
        guard let allTeams = self.allTeams else {return nil}
        return allTeams[atIndex.row]
    }
    
    func getAllEventsCount() -> Int {
        return self.allEvents?.count ?? 0
    }
    
    func getAllEvents(atIndex: IndexPath) -> Event? {
        guard let allEvents = self.allEvents else {return nil}
        return allEvents[atIndex.row]
        
    }
    
    
}
