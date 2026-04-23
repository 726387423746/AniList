public import Foundation
public import CoreData


public typealias FavoriteAnimeCoreDataPropertiesSet = NSSet

extension FavoriteAnime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteAnime> {
        return NSFetchRequest<FavoriteAnime>(entityName: "FavoriteAnime")
    }

    @NSManaged public var userRating: Double
    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var synopsis: String?
    @NSManaged public var episodes: Int64
    @NSManaged public var rank: Int64
    @NSManaged public var popularity: Int64
    @NSManaged public var score: Double
    @NSManaged public var genres: Data?
    @NSManaged public var images: Data?

}

extension FavoriteAnime : Identifiable {
    
}
