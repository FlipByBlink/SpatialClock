import SwiftUI

struct 🛠️SettingMenu: View {
    @EnvironmentObject var model: 🥽AppModel
    var body: some View {
        TabView {
            🛠️ClockTab()
            🛠️VisualTab()
            🛠️RestTab()
            🛠️TipsTab()
            🛠️AboutTab()
        }
        .frame(width: 520, height: 600)
    }
}
