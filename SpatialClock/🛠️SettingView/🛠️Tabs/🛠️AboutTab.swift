import SwiftUI

struct 🛠️AboutTab: View {
    var body: some View {
        NavigationStack {
            List {
                ℹ️IconAndName()
                ℹ️AboutAppContent()
            }
        }
        .tabItem { Label("About", systemImage: "info") }
    }
}
