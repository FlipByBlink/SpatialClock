import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: 📱AppModel
    var body: some View {
        🕐ClockView()
            .glassBackgroundEffect(displayMode: self.model.hideBackground ? .never : .always)
            .overlay { 🛠️SettingButton() }
            .animation(.default, value: self.model.presentSettingButton)
            .persistentSystemOverlays(.hidden)
    }
}
