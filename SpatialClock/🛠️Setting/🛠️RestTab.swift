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
                        Label("Show percent number", systemImage: "percent")
                    }
                    .disabled(!self.model.showBattery)
                } header: {
                    Text("Battery")
                } footer: {
                    Text("""
                    It may be a rough number.
                    (e.g. 100% → 95% → 90% → 85% …)
                    """)
                }
            }
            .navigationTitle("Rest setting")
        }
        .tabItem { Label("Rest", systemImage: "ellipsis") }
    }
}
