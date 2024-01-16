import SwiftUI

struct 🛠️ClockTab: View {
    @EnvironmentObject var model: 📱AppModel
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Toggle(isOn: self.$model.hideDate) {
                        Label("Hide date", systemImage: "calendar")
                    }
                    Toggle(isOn: self.$model.hideYear) {
                        Label("Hide year", systemImage: "calendar.circle")
                    }
                    .disabled(self.model.hideDate)
                    Toggle(isOn: self.$model.hideWeekday) {
                        Label("Hide weekday", systemImage: "calendar.circle.fill")
                    }
                    .disabled(self.model.hideDate)
                }
                Section {
                    Toggle(isOn: self.$model.hideSecond) {
                        Label("Hide second", systemImage: "fitness.timer")
                    }
                }
            }
            .navigationTitle("Clock setting")
        }
        .tabItem { Label("Clock", systemImage: "clock") }
    }
}

