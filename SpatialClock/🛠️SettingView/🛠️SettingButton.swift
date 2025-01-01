import SwiftUI

struct 🛠️SettingButton: View {
    @EnvironmentObject var model: 🥽AppModel
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.openWindow) var openWindow
    var body: some View {
        Button {
            self.openWindow(id: "setting")
            withAnimation {
                self.model.isPresentedSettingButton = false
            }
        } label: {
            HStack(spacing: 16) {
                Image(systemName: "gearshape")
                Text("Open setting")
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .glassBackgroundEffect()
        }
        .buttonStyle(.plain)
        .padding(.top)
        .onChange(of: self.scenePhase) { _, newValue in
            switch newValue {
                case .inactive,
                        .background:
                    self.model.isPresentedSettingButton = false
                default:
                    break
            }
        }
    }
}
