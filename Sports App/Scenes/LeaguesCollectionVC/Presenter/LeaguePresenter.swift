//
//  LeaguePresenter.swift
//  Sports App
//
//  Created by mac on 2/2/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation

protocol FetchingDataFromAPIProtocol {
        func fetchDataFromAPI()
}

protocol LeaguePresenterProtocol {
    func getAllLeaguesCount() -> Int
    func getDataAtIndex(ATIndex : IndexPath) -> League?
}

protocol ViewToPresenterDelegate {
    func reloadCollectionViewData()
}

class LeaguePresenter : FetchingDataFromAPIProtocol,LeaguePresenterProtocol {
   
    
    
    var view : ViewToPresenterDelegate?
    var allLeagues : [League]?
    
    init(view : ViewToPresenterDelegate) {
        self.view = view
        fetchDataFromAPI()
    }
    
    func fetchDataFromAPI(){
        
        let network = NetworkManager()
        network.request(fromEndpoint: EndPoint.allLeagues) { [weak self] (result:Result<AllLeagues, Error>) in
            
            switch result {
            case .success(let response):
                self?.allLeagues = response.countrys
                self?.view?.reloadCollectionViewData()
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
}
