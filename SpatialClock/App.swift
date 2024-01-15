import SwiftUI

@main
struct SpatialClockApp: App {
    @StateObject private var model: 📱AppModel = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.model)
        }
        .windowResizability(.contentSize)
        WindowGroup(id: "setting") {
            🛠️SettingMenu()
                .environmentObject(self.model)
        }
        .defaultSize(width: 420, height: 600)
        .windowResizability(.contentSize)
    }
}
