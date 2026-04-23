import Foundation

struct JSONResponse: Codable, Sendable {
    let data: [AnimeDataModel]
}

struct AnimeDataModel: Codable, Hashable, Identifiable, Sendable {
    let id: Int
    let title: String
    let images: AnimeImageModel
    let synopsis: String?
    let episodes: Int?
    let genres: [GenreModel]
    let rank: Int?
    let popularity: Int?
    let score: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case title
        case images
        case synopsis
        case episodes
        case genres
        case rank
        case popularity
        case score
    }
}

struct AnimeImageModel: Codable, Hashable, Sendable {
    let jpg: JPGModel
}

struct JPGModel: Codable, Hashable, Sendable {
    let imageURL: String
    let smallImageURL: String
    let largeImageURL: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case smallImageURL = "small_image_url"
        case largeImageURL = "large_image_url"
    }
}

struct GenreModel: Codable, Hashable, Identifiable, Sendable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case name
    }
}
