import SwiftUI

struct StatsView: View {
    let rank: Int?
    let score: Double?
    let popularity: Int?
    let episodes: Int?
    
    var body: some View {
        Grid(horizontalSpacing: 16, verticalSpacing: 16) {
            GridRow {
                StatCardView(
                    title: "Rank",
                    value:  "#\(rank?.formatted() ?? "N/A")",
                    systemImage: "trophy.fill",
                    iconColor: [.yellow, .orange],
                    iconBackground: AnyShapeStyle(.orange.opacity(0.2)),
                    cardBackground: AnyShapeStyle(.ultraThinMaterial)
                )
                StatCardView(
                    title: "Score",
                    value: score?.formatted() ?? "N/A",
                    systemImage: "star.fill",
                    iconColor: [.yellow, .green],
                    iconBackground: AnyShapeStyle(.yellow.opacity(0.2)),
                    cardBackground: AnyShapeStyle(.ultraThinMaterial)
                )
            }
            GridRow {
                StatCardView(
                    title: "Popularity",
                    value:  "#\(popularity?.formatted() ?? "N/A")",
                    systemImage: "suit.heart.fill",
                    iconColor: [.pink, .red],
                    iconBackground: AnyShapeStyle(.red.opacity(0.2)),
                    cardBackground: AnyShapeStyle(.ultraThinMaterial)
                )
                StatCardView(
                    title: "Episodes",
                    value: episodes?.formatted() ?? "N/A",
                    systemImage: "play.tv.fill",
                    iconColor: [.cyan, .blue],
                    iconBackground: AnyShapeStyle(.blue.opacity(0.2)),
                    cardBackground: AnyShapeStyle(.ultraThinMaterial)
                )
            }
        }
    }
}
