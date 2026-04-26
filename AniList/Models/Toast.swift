import SwiftUI

enum ToastType {
    case success, error, info
    
    var icon: String {
        switch self {
        case .success: "checkmark.circle.fill"
        case .error: "xmark.circle.fill"
        case .info: "info.circle.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .success: .green
        case .error: .red
        case .info: .blue
        }
    }
}

struct Toast: Equatable {
    let type: ToastType
    let message: String
}
