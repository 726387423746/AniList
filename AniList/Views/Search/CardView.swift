import SwiftUI

struct CardView: View {
    let anime: AnimeDataModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            CardBackground()
            
            HStack(spacing: 16) {
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
                .frame(width: 75, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(anime.title)
                        .bold()
                        .font(.title3)
                        .foregroundStyle(.purple)
                        .lineLimit(2)
                    
                    HStack(spacing: 12) {
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                                .font(.subheadline)
                            Text(String(format: "%.2f", anime.score ?? 0))
                                .foregroundStyle(.yellow)
                                .font(.subheadline)
                                .bold()
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: "play.tv.fill")
                                .foregroundStyle(.blue)
                                .font(.subheadline)
                            Text("\(anime.episodes ?? 0) Eps")
                                .foregroundStyle(.blue)
                                .font(.subheadline)
                                .bold()
                        }
                    }
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
}

