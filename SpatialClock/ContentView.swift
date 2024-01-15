import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: AppModel
    @Environment(\.openWindow) var openWindow
    var body: some View {
        VStack {
            TimelineView(.animation) { context in
                VStack {
                    if !self.model.hideDate {
                        Text(context.date.formatted(date: .numeric, time: .omitted))
                    }
                    Text(context.date.formatted(date: .omitted, time: .standard))
                }
                .font(.system(size: 100, weight: .bold).monospacedDigit())
                .contentTransition(.numericText())
                .animation(.default, value: context.date)
                .padding(48)
            }
            .overlay(alignment: .bottomTrailing) {
                Button {
                    self.openWindow(id: "setting")
                    self.model.presentSettingWindow = true
                } label: {
                    Label("Setting", systemImage: "gearshape")
                        .fontWeight(.light)
                        .labelStyle(.iconOnly)
                        .padding(12)
                }
                .foregroundStyle(.tertiary)
                .buttonStyle(.plain)
                .padding(24)
                .disabled(self.model.presentSettingWindow)
            }
        }
        .animation(.default, value: self.model.hideDate)
        .fixedSize()
    }
}
