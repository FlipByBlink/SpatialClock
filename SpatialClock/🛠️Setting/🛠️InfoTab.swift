import SwiftUI

struct 🛠️InfoTab: View {
    var body: some View {
        NavigationStack {
            List {
                Text("The clock is accurate to within one second.")
                Text(#"If both the "Animation on" setting and the "Show seconds" setting are enabled, there is a possibility of consuming a certain amount of CPU resources."#)
                Text("This app is dedicated for Shared Space. It cannot be used when using a Full Space app.")
                Self.links()
            }
            .navigationTitle("Info")
        }
        .tabItem { Label("Info", systemImage: "info") }
    }
}

fileprivate extension 🛠️InfoTab {
    private static func links() -> some View {
        Group {
            Section {
                Link(destination: .init(string: "https://www.apple.com")!) {
                    Label("App Store link", systemImage: "link")
                }
            }
            Section {
                Link(destination: .init(string: "https://github.com/FlipByBlink/SpatialClock")!) {
                    Label("Source code link", systemImage: "link")
                }
            }
        }
    }
}
