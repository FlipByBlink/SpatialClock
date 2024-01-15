import SwiftUI

@main
struct SpatialClockApp: App {
    @StateObject private var model: AppModel = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.model)
        }
        .windowResizability(.contentSize)
        WindowGroup(id: "setting") {
            SettingView()
                .environmentObject(self.model)
        }
        .windowResizability(.contentSize)
    }
}
