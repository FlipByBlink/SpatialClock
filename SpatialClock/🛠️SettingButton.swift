import SwiftUI

struct 🛠️SettingButton: View {
    @EnvironmentObject var model: 📱AppModel
    @Environment(\.openWindow) var openWindow
    var body: some View {
        Button {
            self.openWindow(id: "setting")
            self.model.presentSettingWindow = true
            withAnimation {
                self.model.presentSettingButton = false
            }
        } label: {
            HStack(spacing: 20) {
                Image(systemName: "gearshape")
                Text("Open setting")
            }
            .font(.system(size: 48, weight: .semibold))
            .padding(24)
        }
        .glassBackgroundEffect()
        .offset(y: 70)
        .offset(z: self.model.presentSettingButton ? 50 : -20)
        .opacity(self.model.presentSettingButton ? 1 : 0)
    }
}
