import SwiftUI

@main
struct SpatialClockApp: App {
    
    @StateObject private var model = 🥽AppModel()
    
    var body: some Scene {
        
        WindowGroup(id: "clock") {
            ContentView()
                .environmentObject(self.model)
                .frame(depth: 300)
        }
        .defaultSize(width: 800, height: 300, depth: 300)
        .windowResizability(.contentSize)
        .volumeWorldAlignment(.gravityAligned)
        .windowStyle(.volumetric)
        
        WindowGroup(id: "setting") {
            🛠️SettingMenu()
                .environmentObject(self.model)
        }
        .defaultSize(width: 520, height: 600)
        .windowResizability(.contentSize)
        .defaultLaunchBehavior(.suppressed)
        .defaultWindowPlacement { _, context in
                .init(context.windows.compactMap({.above($0)}).first)
        }
    }
}
