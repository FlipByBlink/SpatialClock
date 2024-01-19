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
            .font(.system(size: 42, weight: .semibold))
            .padding(.horizontal)
            .padding(24)
            .fixedSize()
        }
        .glassBackgroundEffect()
        .offset(z: self.model.presentSettingButton ? 50 : 0)
        .opacity(self.model.presentSettingButton ? 1 : 0)
        .onChange(of: self.scenePhase) { _, newValue in
            switch newValue {
                case .inactive, .background: self.model.presentSettingButton = false
                default: break
            }
        }
    }
}
