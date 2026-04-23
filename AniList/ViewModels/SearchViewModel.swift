import Foundation

@Observable
final class SearchViewModel {
    var search: String = ""
    var searchResults: [AnimeDataModel] = []
    var errorMessage: String?
    var isLoading: Bool = false
    
    func searchAnime() async {
        isLoading = true
        do {
            searchResults = try await JikanService.shared.searchAnime(for: search)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}

