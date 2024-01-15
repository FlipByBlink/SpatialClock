import SwiftUI

struct 🛠️SettingButton: View {
    @EnvironmentObject var model: 📱AppModel
    @Environment(\.openWindow) var openWindow
    var body: some View {
        Button {
            self.openWindow(id: "setting")
            self.model.presentSettingWindow = true
        } label: {
            Label("Setting", systemImage: "gearshape")
                .fontWeight(.light)
                .labelStyle(.iconOnly)
                .padding(12)
        }
        .foregroundStyle(self.model.presentSettingWindow ? .quaternary : .tertiary)
        .buttonStyle(.plain)
        .padding(.init(min(24, self.model.padding)))
        .disabled(self.model.presentSettingWindow)
    }
}
