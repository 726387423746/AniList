public import Foundation
public import CoreData

public typealias FavoriteAnimeCoreDataClassSet = NSSet

@objc(FavoriteAnime)
public class FavoriteAnime: NSManagedObject {
    static func create(_ anime: AnimeDataModel, context: NSManagedObjectContext) {
        let entity = FavoriteAnime(context: context)
        entity.id = Int64(anime.id)
        entity.title = anime.title
        entity.synopsis = anime.synopsis
        entity.episodes = Int64(anime.episodes ?? 0)
        entity.genres = try? JSONEncoder().encode(anime.genres)
        entity.images = try? JSONEncoder().encode(anime.images)
        entity.score = anime.score ?? 0.0
        entity.rank = Int64(anime.rank ?? 0)
        entity.popularity = Int64(anime.popularity ?? 0)
    }
}
