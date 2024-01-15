import SwiftUI

struct 🛠️SettingButton: View {
    @EnvironmentObject var model: 📱AppModel
    @Environment(\.openWindow) var openWindow
    var body: some View {
        if self.model.presentSettingButton {
            Button {
                self.openWindow(id: "setting")
                self.model.presentSettingWindow = true
                self.model.presentSettingButton = false
            } label: {
                Label("Open setting", systemImage: "gearshape")
                    .font(.largeTitle)
                    .padding(24)
            }
            .buttonStyle(.plain)
            .glassBackgroundEffect()
            .offset(y: 50)
            .offset(z: 50)
        }
    }
}
