import SwiftUI

struct SearchView: View {
    @State private var searchViewModel = SearchViewModel()
    @State private var favoritesViewModel = FavoritesViewModel.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                AppBackground()
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.purple)
                            .padding(.trailing, 8)
                        TextField("Search for an anime",
                            text: $searchViewModel.search,
                            prompt: Text("Search for an anime")
                                .foregroundStyle(.purple)
                                .font(.subheadline)
                        )
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .foregroundStyle(.purple)
                        .onSubmit {
                            Task {
                                await searchViewModel.searchAnime()
                            }
                        }
                    }
                    .padding()
                    .glowingBorder()
                    List {
                        ForEach(searchViewModel.searchResults) { result in
                            HStack {
                                CardView(anime: result)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.purple)
                                    .font(.caption)
                            }
                            .background {
                                NavigationLink(value: result) {
                                    EmptyView()
                                }
                                .opacity(0)
                            }
                            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                Button {
                                    favoritesViewModel.toggleFavorite(anime: result)
                                } label: {
                                    Label("Favorite", systemImage: "heart.fill")
                                }
                                .tint(favoritesViewModel.favoriteAnimeArray.contains(where: { $0.id == Int64(result.id) }) ? .red : .gray)
                            }
                            .listRowSeparatorTint(.purple)
                            .listRowBackground(Color.black)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(.clear)
                }
            }
            .navigationDestination(for: AnimeDataModel.self) { anime in
                DetailView(anime: anime)
            }
        }
    }
}
