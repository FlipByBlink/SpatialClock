import SwiftUI

struct 🛠️SettingButton: View {
    @EnvironmentObject var model: 📱AppModel
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.openWindow) var openWindow
    var body: some View {
        Button {
            self.openWindow(id: "setting")
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
        .onChange(of: self.scenePhase) { _, newValue in
            switch newValue {
                case .inactive, .background: self.model.presentSettingButton = false
                default: break
            }
        }
    }
}
