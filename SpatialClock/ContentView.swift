import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: AppModel
    @Environment(\.openWindow) var openWindow
    var body: some View {
        VStack {
            TimelineView(.animation) { context in
                VStack {
                    if !self.model.hideDate {
                        Text(context.date.formatted(.dateTime.year().day().month()))
                    }
                    Text(
                        context.date.formatted(
                            self.model.hideSecond ? .dateTime.hour().minute() : .dateTime.hour().minute().second()
                        )
                    )
                }
                .font(.system(size: .init(self.model.fontSize),
                              weight: .bold))
                .monospacedDigit()
                .contentTransition(.numericText())
                .animation(.default, value: context.date)
                .padding(.init(self.model.padding))
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
                .foregroundStyle(self.model.presentSettingWindow ? .quaternary : .tertiary)
                .buttonStyle(.plain)
                .padding(.init(min(24, self.model.padding)))
                .disabled(self.model.presentSettingWindow)
            }
            .opacity(self.model.opacity)
        }
        .animation(.default, value: self.model.hideDate)
        .fixedSize()
    }
}
