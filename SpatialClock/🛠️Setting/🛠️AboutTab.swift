import SwiftUI

struct 🛠️AboutTab: View {
    var body: some View {
        NavigationStack {
            List {
                ℹ️AboutAppContent()
            }
            .navigationTitle(String(localized: "About App", table: "🌐AboutApp"))
        }
        .tabItem { Label("About", systemImage: "info") }
    }
}
