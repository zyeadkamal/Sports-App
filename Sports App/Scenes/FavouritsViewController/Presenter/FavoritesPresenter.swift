
import Foundation
import CoreData

protocol FavoritesPresenterProtocol {
    func getLeaguesCount() -> Int
    func getLeagueAt(index : Int) -> FavoriteLeague
    func setAPIKey(index : IndexPath) -> String
    func getAllLeagues()
}
class FavoritesPresenter : FavoritesPresenterProtocol
{
    var view            : FavoritesViewProtocol?
    var dbService       : DBManager?
    var favoriteLeagues : [FavoriteLeague] = []
    
    init(view : FavoritesViewProtocol)
    {
        self.view = view
        getAllLeagues()
    }
    
    func getLeaguesCount() -> Int {
        favoriteLeagues.count
    }
    
    func getLeagueAt(index: Int) -> FavoriteLeague{
        return favoriteLeagues[index]
    }
    
    func setAPIKey(index: IndexPath) -> String {
        favoriteLeagues[index.row].strLeague ?? ""
    }
    
    func getAllLeagues() {
        dbService = CoreDataService()
        let nsFavoriteLeagues = dbService?.fetch()
        self.favoriteLeagues  = fromNSManagedObjectToMovie(nsFavoriteLeagues!)
    }
    
    func fromNSManagedObjectToMovie(_ objArr : [NSManagedObject]) -> [FavoriteLeague]
    {
        var ret : [FavoriteLeague] = []
        for obj in objArr
        {
            let _strLeague = (obj.value(forKey: "strLeague") as! String)
            let _strBadge  = (obj.value(forKey: "strBadge") as! String)
            ret.append(FavoriteLeague(strLeague: _strLeague, strBadge: _strBadge))
        }
        return ret
    }
    
    
}
