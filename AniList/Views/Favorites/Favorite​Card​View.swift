import SwiftUI

struct FavoriteCardView: View {
    let anime: FavoriteAnime
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if let data = anime.imageData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 170, height: 240)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.gray.opacity(0.3))
                    .frame(width: 170, height: 240)
                    .overlay {
                        Image(systemName: "photo")
                            .font(.largeTitle)
                            .foregroundStyle(.gray)
                    }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(anime.title ?? "Unknown")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.white)
                    .lineLimit(2)
                
                
            }
            .padding(8)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8))
            .padding(6)
            
        }
    }
}
