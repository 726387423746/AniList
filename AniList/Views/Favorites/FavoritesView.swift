import SwiftUI

struct FavoritesView: View {
    @State private var favoritesViewModel = FavoritesViewModel.shared
    var body: some View {
        ZStack {
            AppBackground()
            if favoritesViewModel.favoriteAnimeArray.isEmpty {
                ContentUnavailableView("No Favorites Yet",
                    systemImage: "heart.slash",
                    description: Text("Anime you favorite will appear here"))
            }
            
        }
    }
}
