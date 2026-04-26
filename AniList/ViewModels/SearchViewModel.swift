import Foundation

@Observable
final class SearchViewModel {
    var search: String = ""
    var searchResults: [AnimeDataModel] = []
    var isLoading: Bool = false
    
    func searchAnime() async throws {
        isLoading = true
        defer {isLoading = false}
        searchResults = try await JikanService.shared.searchAnime(for: search)
    }
}

