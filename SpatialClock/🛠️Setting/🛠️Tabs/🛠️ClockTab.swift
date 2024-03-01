import SwiftUI

struct 🛠️ClockTab: View {
    @EnvironmentObject var model: 🥽AppModel
    @Environment(\.openWindow) var openWindow
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Toggle(isOn: self.$model.hideDate) {
                        Label("Hide date", systemImage: "calendar")
                    }
                    Group {
                        Toggle(isOn: self.$model.showYear) {
                            Label("Show year", systemImage: "calendar.circle")
                                .opacity(self.model.hideDate ? 0.6 : 1)
                        }
                        Toggle(isOn: self.$model.hideWeekday) {
                            Label("Hide weekday", systemImage: "calendar.circle.fill")
                                .opacity(self.model.hideDate ? 0.6 : 1)
                        }
                    }
                    .disabled(self.model.hideDate)
                    .animation(.default, value: self.model.hideDate)
                }
                Section {
                    Toggle(isOn: self.$model.showSecond) {
                        Label("Show second", systemImage: "fitness.timer")
                    }
                }
            }
            .navigationTitle("Clock setting")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    if self.model.closedClockWindow {
                        Button {
                            self.openWindow(id: "clock")
                        } label: {
                            HStack {
                                Image(systemName: "clock.fill")
                                Text("Open clock window")
                            }
                        }
                    }
                }
            }
        }
        .tabItem { Label("Clock", systemImage: "clock") }
    }
}
