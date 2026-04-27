import SwiftUI

struct FavoriteStarView: View {
    let userRating: Double
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0...4, id: \.self) { star in
                PartialStarView(percentage: min(max(userRating - Double(star), 0), 1))
            }
        }
    }
}

struct PartialStarView: View {
    let percentage: Double
    
    var body: some View {
        Image(systemName: "star.fill")
            .font(.title)
            .foregroundStyle(.yellow)
            .mask {
                GeometryReader { geo in
                    Rectangle()
                        .frame(width: geo.size.width * percentage, height: geo.size.height)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .background(
                Image(systemName: "star.fill")
                    .font(.title)
                    .foregroundStyle(.gray)
            )
    }
}
