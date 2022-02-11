//
//  SportsPresenter.swift
//  Sports App
//
//  Created by Mohamed AMR on 2/2/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation


protocol SportsPresenterProtocol {
    func getSportsCount() -> Int
    func getSportAt(index : Int) -> Sport
    func setAPIKey(index : IndexPath) -> String
    func getAllSports()
}

class SportsPresenter : SportsPresenterProtocol
{
    
    //MARK:- Variables
    var sports : [Sport] = []
    weak var view   : SportsViewProtocol?
    
    init(view : SportsViewProtocol)
    {
        self.view = view
        testConnection()
    }
    
    func getSportsCount() -> Int {
        return sports.count
    }
    
    func getSportAt(index: Int) -> Sport {
        return sports[index]
    }
    
    func getAllSports(){
        let network = NetworkManager()
        network.request(fromEndpoint: .allSports, httpMethod: .post, parametrs: [:]) { [weak self] (result:Result<AllSportsResponse, Error>) in
            switch result {
            case .success(let response):
                self?.sports = response.sports ?? []
                self?.view?.reloadCollectionView()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setAPIKey(index: IndexPath)-> String {
        return sports[index.row].strSport ?? ""
    }
    
    func testConnection() {
        if InternetConnectionManager.isConnectedToNetwork(){
            view?.hideConnectionFaildImage()
            getAllSports()
        }else{
            view?.showConnectionFaildImage()
        }
    }
}
