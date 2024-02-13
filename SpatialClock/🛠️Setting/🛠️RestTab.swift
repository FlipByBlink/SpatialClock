import SwiftUI

struct 🛠️RestTab: View {
    @EnvironmentObject var model: 📱AppModel
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Toggle(isOn: self.$model.showBattery) {
                        Label("Show battery level", systemImage: "battery.100percent.bolt")
                    }
                    Toggle(isOn: self.$model.showBatteryNumber) {
                        Label("Show number", systemImage: "percent")
                    }
                    .disabled(!self.model.showBattery)
                } header: {
                    Text("Battery")
                }
            }
            .navigationTitle("Rest setting")
        }
        .tabItem { Label("Rest", systemImage: "ellipsis") }
    }
}
