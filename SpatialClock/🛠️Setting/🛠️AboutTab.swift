import SwiftUI

struct 🛠️AboutTab: View {
    var body: some View {
        NavigationStack {
            List {
                ℹ️IconAndName()
                ℹ️AboutAppContent()
                Self.FeedbackSection()
            }
            .navigationTitle(String(localized: "About App", table: "🌐AboutApp"))
        }
        .tabItem { Label("About", systemImage: "info") }
    }
}

private extension 🛠️AboutTab {
    private struct FeedbackSection: View {
        @State private var copied: Bool = false
        @Environment(\.openURL) var openURL
        var body: some View {
            Section {
                Button {
                    var ⓤrlString = "mailto:" + 🗒️StaticInfo.contactAddress
                    ⓤrlString += "?subject="
                    ⓤrlString += "SpatialClock feedback".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
                    ⓤrlString += "&body=Input%20here"
                    self.openURL(.init(string: ⓤrlString)!)
                } label: {
                    Label("Feedback from mail app", systemImage: "envelope")
                        .badge(Text(Image(systemName: "arrow.up.forward.app")))
                }
                VStack {
                    HStack {
                        Spacer()
                        Text(🗒️StaticInfo.contactAddress)
                            .textSelection(.enabled)
                            .italic()
                        Spacer()
                    }
                    Button("Copy") {
                        UIPasteboard.general.string = 🗒️StaticInfo.contactAddress
                        withAnimation { self.copied = true }
                    }
                    .opacity(self.copied ? 0.3 : 1)
                    .buttonStyle(.bordered)
                    .overlay {
                        if self.copied {
                            Image(systemName: "checkmark")
                                .bold()
                        }
                    }
                }
                .padding(.vertical)
            } header: {
                Text("Feedback")
            } footer: {
                Text("bug report, feature request, impression...")
            }
        }
    }
}
