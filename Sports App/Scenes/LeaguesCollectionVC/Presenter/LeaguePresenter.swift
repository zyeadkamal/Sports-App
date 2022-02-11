//
//  LeaguePresenter.swift
//  Sports App
//
//  Created by mac on 2/2/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation
import CoreData

protocol FetchingDataFromAPIProtocol {
        func fetchDataFromAPI()
}

protocol LeaguePresenterProtocol {
    func attachView(view : LeagueViewToLeaguePresenterDelegate)
    func getAllLeaguesCount() -> Int
    func getDataAtIndex(ATIndex : IndexPath) -> League?
    func getFlag(_ leagueName : String) -> Bool
}

protocol LeagueViewToLeaguePresenterDelegate {
    func reloadCollectionViewData()
}

protocol AssignAPIKey {
    
    var APIKey : String {get set}
}



class LeaguePresenter : FetchingDataFromAPIProtocol,LeaguePresenterProtocol,AssignAPIKey {
    
    
    var APIKey: String
    var view : LeagueViewToLeaguePresenterDelegate
    var dbService : DBManager?
    var allLeagues : [League]?
    
    init(view : LeagueViewToLeaguePresenterDelegate, APIKey: String) {
        self.view = view
        self.APIKey = APIKey
        self.dbService = CoreDataService()
        fetchDataFromAPI()
    }
    
    func attachView(view : LeagueViewToLeaguePresenterDelegate){
        self.view = view
    }
    
    func fetchDataFromAPI(){
        
        let network = NetworkManager()
        network.request(fromEndpoint: EndPoint.allLeagues, httpMethod: .post, parametrs: ["s":APIKey]){ [weak self] (result:Result<AllLeagues, Error>) in
            
            switch result {
            case .success(let response):
                self?.allLeagues = response.countrys?.reversed()
                self?.view.reloadCollectionViewData()
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }

    func getAllLeaguesCount()-> Int{
        return allLeagues?.count ?? 0
    }
    
    func getDataAtIndex(ATIndex: IndexPath) -> League? {
        guard let allLegues = allLeagues else {return nil}
        return allLegues[ATIndex.row]
    }
    func getFlag(_ leagueName : String) -> Bool {
        let tmpNSManagedObject = dbService?.query(leagueName)
        guard let ret = (tmpNSManagedObject?.value(forKey: "isFavorite"))
            else {return false}
        return ret as! Bool
    }
       }
    

