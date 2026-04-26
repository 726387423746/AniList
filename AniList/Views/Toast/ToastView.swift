import SwiftUI

struct ToastView: View {
    let toast: Toast
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: toast.type.icon)
                .foregroundStyle(toast.type.color)
                .font(.title2)
            Text(toast.message)
                .font(.subheadline)
                .foregroundStyle(.primary)
        }
        .padding()
        .background(.ultraThinMaterial, in: Capsule())
        .shadow(color: toast.type.color.opacity(0.3), radius: 8, y: 4)
    }
}

#Preview {
    ToastView(toast: Toast(type: .success, message: "the anime saved successfully"))
    ToastView(toast: Toast(type: .error, message: "No internet"))
    ToastView(toast: Toast(type: .info, message: "Your list is empty"))
}
