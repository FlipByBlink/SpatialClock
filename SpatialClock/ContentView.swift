import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: 📱AppModel
    var body: some View {
        🕐ClockView()
            .overlay(alignment: .bottomTrailing) { 🛠️SettingButton() }
    }
}
