import SwiftUI

struct DetailView: View {
    let anime: AnimeDataModel
    
    @State private var isSynopsisExpanded = false
    var body: some View {
        ZStack {
            AppBackground()
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: anime.images.jpg.largeImageURL)) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                        case .empty:
                            ProgressView()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        case .failure:
                            Image(systemName: "photo")
                                .font(.largeTitle)
                                .foregroundStyle(.gray)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(width: 250, height: 350)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                    Text(anime.title)
                        .font(.title.bold())
                        .foregroundStyle(.black)
                    GenreLayout(spacing: 8) {
                        ForEach(anime.genres) { genre in
                            Text(genre.name)
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(
                                    Capsule()
                                        .fill(Color.orange.opacity(0.15))
                                )
                                .foregroundColor(.orange)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(Color.orange.opacity(0.3), lineWidth: 2)
                                )
                        }
                    }
                    StatsView(
                        rank: anime.rank,
                        score: anime.score,
                        popularity: anime.popularity,
                        episodes: anime.episodes
                    )
                    Text(anime.synopsis ?? "No synopsis available")
                        .foregroundStyle(.white)
                        .lineLimit(isSynopsisExpanded ? nil : 3)
                        .animation(.easeInOut, value: isSynopsisExpanded)
                    Button(isSynopsisExpanded ? "Read Less" : "Read More") {
                        isSynopsisExpanded.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(anime: AnimeDataModel(
            id: 20,
            title: "Naruto",
            images: AnimeImageModel(
                jpg: JPGModel(
                    imageURL: "https://myanimelist.net/images/anime/1141/142503.jpg",
                    smallImageURL: "https://myanimelist.net/images/anime/1141/142503t.jpg",
                    largeImageURL: "https://myanimelist.net/images/anime/1141/142503l.jpg"
                )
            ),
            synopsis: "Twelve years ago, a colossal demon fox terrorized the world. Team 7 takes on a series of difficult missions, forcing its members to grow in strength and comradery despite their many differences.",
            episodes: 220,
            genres: [
                GenreModel(id: 1, name: "Action"),
                GenreModel(id: 2, name: "Adventure"),
                GenreModel(id: 10, name: "Fantasy")
            ],
            rank: 722,
            popularity: 9,
            score: 8.02
        ))
    }
}
