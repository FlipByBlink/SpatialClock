import SwiftUI

struct 🛠️SettingMenu: View {
    @EnvironmentObject var model: 🥽AppModel
    var body: some View {
        TabView {
            🛠️WidgetTab() //TODO: remove
            🛠️ClockTab()
            🛠️VisualTab()
            🛠️RestTab()
            🛠️TipsTab()
            🛠️WidgetTab()
            🛠️AboutTab()
            🛠️RequestTab()
        }
        .frame(width: 520, height: 600)
    }
}
