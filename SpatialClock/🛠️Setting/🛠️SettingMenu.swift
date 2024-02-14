import SwiftUI

struct 🛠️SettingMenu: View {
    @EnvironmentObject var model: 🥽AppModel
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.dismissWindow) var dismissWindow
    var body: some View {
        TabView {
            🛠️ClockTab()
            🛠️VisualTab()
            🛠️RestTab()
            🛠️TipsTab()
            🛠️AboutTab()
        }
        .frame(width: 520, height: 600)
        .onChange(of: self.scenePhase) { _, newValue in
            switch newValue {
                case .background: self.dismissWindow()
                default: break
            }
        }
    }
}
