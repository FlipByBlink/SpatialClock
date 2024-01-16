import SwiftUI

struct 🛠️SettingMenu: View {
    @EnvironmentObject var model: 📱AppModel
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.dismissWindow) var dismissWindow
    var body: some View {
        TabView {
            🛠️ClockTab()
            🛠️VisualTab()
            🛠️InfoTab()
        }
        .frame(maxWidth: 420, maxHeight: 600)
        .onChange(of: self.scenePhase) { _, newValue in
            switch newValue {
                case .background: self.dismissWindow()
                default: break
            }
        }
    }
}
