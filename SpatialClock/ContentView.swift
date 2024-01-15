import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: 📱AppModel
    var body: some View {
        🕒ClockView()
            .overlay { 🛠️SettingButton() }
            .persistentSystemOverlays(.hidden)
    }
}
