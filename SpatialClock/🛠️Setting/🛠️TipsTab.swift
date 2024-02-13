import SwiftUI

struct 🛠️TipsTab: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("The clock is accurate to within one second.")
                }
                Section {
                    Text("This app is dedicated for Shared Space. It cannot be used when using a Full Space app.")
                }
                Section {
                    Text(#"If both the "Animation on" setting and the "Show seconds" setting are enabled, there is a possibility of consuming a certain amount of CPU resources."#)
                }
            }
            .navigationTitle("Tips")
        }
        .tabItem { Label("Tips", systemImage: "questionmark") }
    }
}
