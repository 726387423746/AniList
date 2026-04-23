import SwiftUI

struct AppBackground: View {
    var body: some View {
        MeshGradient(
            width: 3, height: 3,
            points: [
                [0, 0], [0.5, 0], [1, 0],
                [0, 0.5], [0.5, 0.5], [1, 0.5],
                [0, 1], [0.5, 1], [1, 1]
            ],
            colors: [
                .purple, .black, .purple,
                .black, .purple.opacity(0.5), .black,
                .purple, .black, .purple
            ]
        )
        .ignoresSafeArea()
    }
}
