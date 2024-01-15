import SwiftUI

@main
struct SpatialClockApp: App {
    @StateObject private var model: 📱AppModel = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.model)
                .offset(z: 100)
                .frame(depth: 200)
        }
        .defaultSize(width: 800, height: 200, depth: 200)
        .windowResizability(.contentSize)
        .windowStyle(.volumetric)
        WindowGroup(id: "setting") {
            🛠️SettingMenu()
                .environmentObject(self.model)
        }
        .defaultSize(width: 420, height: 600)
        .windowResizability(.contentSize)
    }
}
