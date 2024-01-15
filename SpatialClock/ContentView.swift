import SwiftUI

struct ContentView: View {
    @State private var presentSetting: Bool = false
    @State private var hideDate: Bool = false
    var body: some View {
        VStack {
            TimelineView(.animation) { context in
                VStack {
                    if !self.hideDate {
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
                    self.presentSetting.toggle()
                } label: {
                    Label("Setting",
                          systemImage: self.presentSetting ? "checkmark" : "gearshape")
                    .labelStyle(.iconOnly)
                    .padding()
                }
                .foregroundStyle(.tertiary)
                .buttonStyle(.plain)
                .padding()
            }
            if self.presentSetting {
                Divider()
                VStack {
                    Toggle(isOn: self.$hideDate) {
                        Label("Hide date", systemImage: "calendar")
                    }
                    .padding()
                }
                .padding(.horizontal, 48)
            }
        }
        .animation(.default, value: self.presentSetting)
        .animation(.default, value: self.hideDate)
        .fixedSize()
    }
}
