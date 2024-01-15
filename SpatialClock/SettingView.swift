import SwiftUI

struct SettingView: View {
    @EnvironmentObject var model: AppModel
    var body: some View {
        NavigationStack {
            List {
                Toggle(isOn: self.$model.hideDate) {
                    Label("Hide date", systemImage: "calendar")
                }
            }
            .navigationTitle("Setting")
        }
        .frame(maxWidth: 600, maxHeight: 800)
        .onDisappear {
            self.model.presentSettingWindow = false
        }
    }
}
