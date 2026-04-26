import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var toastViewModel = ToastViewModel()
    
    var body: some View {
        TabView {
            Tab("Favorites", systemImage: "heart.fill") {
                FavoritesView()
            }
            Tab("Search", systemImage: "magnifyingglass") {
                SearchView()
            }
        }
        .environment(toastViewModel)
        .overlay(alignment: .top) {
            if let toast = toastViewModel.currentToast {
                ToastView(toast: toast)
                    .padding(.top, 60)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .onTapGesture {
                        toastViewModel.kill()
                    }
                
            }
        }
    }
}
