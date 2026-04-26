import SwiftUI

@Observable
final class ToastViewModel {
    var currentToast: Toast?
    private var killerTask: Task<Void, Never>?
    
    func show(_ toast: Toast, duration: Double = 2.0) {
        killerTask?.cancel()
        withAnimation(.spring(duration: 0.4, bounce: 0.2)) {
            currentToast = toast
        }
        
        killerTask = Task {
            try? await Task.sleep(for: .seconds(duration))
            guard !Task.isCancelled else { return }
            withAnimation(.easeOut(duration: 0.3)) {
                currentToast = nil
            }
        }
    }
    
    func kill() {
        killerTask?.cancel()
        withAnimation(.easeOut(duration: 0.3)) {
            currentToast = nil
        }
    }
}
