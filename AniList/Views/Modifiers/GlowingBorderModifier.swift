import SwiftUI

struct GlowingBorderModifier: ViewModifier {
    private let gradientColors: [Color] = [
        Color(red: 0.4, green: 0.1, blue: 0.7),
        Color(red: 0.7, green: 0.4, blue: 1.0),
        .black,
        Color(red: 0.7, green: 0.4, blue: 1.0),
        Color(red: 0.4, green: 0.1, blue: 0.7),
        .black
    ]
    
    func body(content: Content) -> some View {
        content
            .background(
                Capsule()
                    .fill(Color.black.gradient)
            )
            .overlay(
                Capsule()
                    .strokeBorder(
                        AngularGradient(
                            colors: gradientColors,
                            center: .center,
                            angle: .degrees(0)
                        ),
                        lineWidth: 3.0
                    )
            )
    }
}

extension View {
    func glowingBorder() -> some View {
        modifier(GlowingBorderModifier())
    }
}

