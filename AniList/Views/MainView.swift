import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var body: some View {
        TabView {
            Tab("Favorites", systemImage: "heart.fill") {
                FavoritesView()
            }
            Tab("Search", systemImage: "magnifyingglass") {
                SearchView()
            }
        }
    }
}
