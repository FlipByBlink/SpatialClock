import SwiftUI

struct 🛠️RestTab: View {
    @EnvironmentObject var model: 🥽AppModel
    @Environment(\.openWindow) var openWindow
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        Self.BatteryLevelMenu()
                    } label: {
                        Label("Battery level", systemImage: "battery.100percent.bolt")
                    }
                }
                Section {
                    NavigationLink {
                        Self.DateTimeLayoutMenu()
                    } label: {
                        Label("Date&Time layout", systemImage: "arrow.left.arrow.right")
                    }
                }
                Section {
                    NavigationLink {
                        Self.DirectTouchReservationMenu()
                    } label: {
                        Label("Direct-touch reservation", systemImage: "hand.tap")
                    }
                }
                NavigationLink {
                    Button {
                        self.openWindow(id: "clock")
                    } label: {
                        Label("Open clock window", systemImage: "clock.fill")
                    }
                } label: {
                    Label("Restore window", systemImage: "clock")
                }
            }
            .navigationTitle("Rest setting")
        }
        .tabItem { Label("Rest", systemImage: "ellipsis") }
    }
}

private extension 🛠️RestTab {
    private struct BatteryLevelMenu: View {
        @EnvironmentObject var model: 🥽AppModel
        var body: some View {
            List {
                Section {
                    Toggle(isOn: self.$model.showBattery) {
                        Label("Show battery level", systemImage: "battery.100percent.bolt")
                    }
                }
                Section {
                    Toggle(isOn: self.$model.showBatteryNumber) {
                        Label("Show percent number", systemImage: "percent")
                    }
                    .disabled(!self.model.showBattery)
                    .opacity(self.model.showBattery ? 1 : 0.6)
                    .animation(.default, value: self.model.showBattery)
                } footer: {
                    Text("""
                    It may be a rough number.
                    (e.g. 100% → 95% → 90% → 85% …)
                    """)
                }
                Section {
                    Picker(selection: self.$model.batteryPosition) {
                        ForEach(💾Option.Layout.allCases) { Text($0.label) }
                    } label: {
                        Label("Position", systemImage: "battery.50")
                    }
                    .disabled(!self.model.showBattery)
                    .opacity(self.model.showBattery ? 1 : 0.6)
                    .animation(.default, value: self.model.showBattery)
                }
            }
            .navigationTitle("Battery level")
        }
    }
    private struct DateTimeLayoutMenu: View {
        @EnvironmentObject var model: 🥽AppModel
        var body: some View {
            List {
                Toggle(isOn: self.$model.customizeDateTimeLayout) {
                    Label("Customize Date&Time layout",
                          systemImage: "arrow.left.arrow.right")
                }
                .disabled(self.model.hideDate)
                Section {
                    Picker(selection: self.$model.datePosition) {
                        ForEach(💾Option.Layout.allCases) { Text($0.label) }
                    } label: {
                        Label("Date position", systemImage: "calendar")
                            .opacity(self.isDisabledDatePositionPicker ? 0.6 : 1)
                            .animation(.default, value: self.isDisabledDatePositionPicker)
                    }
                    .disabled(self.isDisabledDatePositionPicker)
                }
            }
            .navigationTitle("Date&Time layout")
        }
        private var isDisabledDatePositionPicker: Bool {
            self.model.customizeDateTimeLayout == false
            ||
            self.model.hideDate
        }
    }
    private struct DirectTouchReservationMenu: View {
        @EnvironmentObject var model: 🥽AppModel
        var body: some View {
            List {
                Section {
                    Stepper(value: self.$model.tapCountForSettingButton, in: 1...4) {
                        LabeledContent {
                            Text(self.model.tapCountForSettingButton.formatted())
                        } label: {
                            Label(#"Tap count for "Open setting" button"#,
                                  systemImage: "hand.tap")
                        }
                    }
                }
            }
            .navigationTitle("Direct-touch reservation")
        }
    }
}
