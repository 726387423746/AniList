import CoreData
import Foundation
import Observation

@Observable
final class FavoritesViewModel {
    static let shared = FavoritesViewModel()
    private init() {}
    let viewContext = PersistenceController.shared.container.viewContext
    var favoriteAnimeArray: [FavoriteAnime] = .init()
    
    func isFavorite(id: Int) -> Bool {
        let request: NSFetchRequest<FavoriteAnime> = FavoriteAnime.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", id)
        request.fetchLimit = 1
        do {
            let count = try viewContext.count(for: request)
            return count > 0
        } catch {
            print("Failed to fetch FavoriteAnime count: \(error.localizedDescription)")
                return false
        }
    }
    
    func addFavorite(anime: AnimeDataModel) {
        guard !isFavorite(id: anime.id) else { return }
        FavoriteAnime.create(anime, context: viewContext)
        do {
            try viewContext.save()
            fetchFavorites()
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func removeFavorite(id: Int) {
        let request: NSFetchRequest<FavoriteAnime> = FavoriteAnime.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", id)
        request.fetchLimit = 1
        
        do {
            if let favorite = try viewContext.fetch(request).first {
                viewContext.delete(favorite)
                try viewContext.save()
                fetchFavorites()
                
            }
        } catch {
            print("Failed to remove favorite: \(error.localizedDescription)")
        }
    }
    
    func fetchFavorites() {
        let request: NSFetchRequest<FavoriteAnime> = FavoriteAnime.fetchRequest()
        
        do {
            favoriteAnimeArray = try viewContext.fetch(request)
        } catch {
            print("Failed to fetch favorite animes: \(error.localizedDescription)")
        }
    }
    
    func toggleFavorite(anime: AnimeDataModel) {
        if isFavorite(id: anime.id) {
            removeFavorite(id: anime.id)
        } else {
            addFavorite(anime: anime)
        }
    }
}
