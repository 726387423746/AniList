import Foundation

final class JikanService {
    static let shared = JikanService()
    private init() { }
    
    func searchAnime(for query: String) async throws -> [AnimeDataModel] {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.jikan.moe"
        components.path = "/v4/anime"
        components.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "sfw", value: "true")
        ]
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(JSONResponse.self, from: data).data
    }
}
