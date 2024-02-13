import SwiftUI

struct 🛠️RestTab: View {
    @EnvironmentObject var model: 📱AppModel
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Toggle(isOn: self.$model.disableHoverEffect) {
                        Label("Disable hover effect",
                              systemImage: "eye.trianglebadge.exclamationmark")
                    }
                }
                Section {
                    Stepper(value: self.$model.tapCountForOpenSettingButton, in: 1...4) {
                        LabeledContent {
                            Text(self.model.tapCountForOpenSettingButton.formatted())
                        } label: {
                            Label(#"Tap count for "Open setting" button"#,
                                  systemImage: "hand.tap")
                        }
                    }
                }
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
