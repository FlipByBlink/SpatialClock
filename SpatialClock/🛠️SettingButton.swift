import SwiftUI

struct 🛠️SettingButton: View {
    @EnvironmentObject var model: 📱AppModel
    @Environment(\.openWindow) var openWindow
    var body: some View {
        Button {
            self.openWindow(id: "setting")
            self.model.presentSettingWindow = true
            self.model.presentSettingButton = false
        } label: {
            Label("Open setting", systemImage: "gearshape")
                .font(.system(size: 50))
                .padding(24)
        }
        .buttonStyle(.plain)
        .glassBackgroundEffect()
        .offset(z: self.model.presentSettingButton ? 50 : -20)
        .opacity(self.model.presentSettingButton ? 1 : 0)
    }
}
