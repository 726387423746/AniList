import SwiftUI

struct StatCardView: View {
    let title: String
    let value: String
    let systemImage: String
    let iconColor: [Color]
    let iconBackground: AnyShapeStyle
    let cardBackground: AnyShapeStyle

    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .foregroundStyle(LinearGradient(colors: iconColor, startPoint: .top, endPoint: .bottom))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8).fill(iconBackground)
                )
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(value)
                    .font(.headline)
                    .bold()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(cardBackground))
    }
}
