import SwiftUI

struct 🕒ClockView: View {
    @EnvironmentObject var model: 📱AppModel
    var body: some View {
        TimelineView(.animation) { context in
            HStack(spacing: 32) {
                if !self.model.hideDate {
                    Text(context.date.formatted(self.dateFormat))
                }
                Text(context.date.formatted(self.timeFormat))
            }
            .font(.system(size: .init(self.model.fontSize),
                          weight: .bold))
            .monospacedDigit()
            .contentTransition(.numericText())
            .animation(.default, value: context.date)
            .padding(.init(self.model.padding))
        }
        .animation(.default, value: self.model.hideDate)
        .opacity(self.model.opacity)
        .fixedSize()
        .opacity(self.model.presentSettingButton ? 0.5 : 1)
        .offset(z: self.model.presentSettingButton ? -20 : 0)
        .onTapGesture {
            if !self.model.presentSettingWindow {
                withAnimation { self.model.presentSettingButton.toggle() }
            }
        }
    }
}

fileprivate extension 🕒ClockView {
    private var dateFormat: Date.FormatStyle {
        .dateTime.year().month().day().weekday()
    }
    private var timeFormat: Date.FormatStyle {
        if self.model.hideSecond {
            .dateTime.hour().minute()
        } else {
            .dateTime.hour().minute().second()
        }
    }
}
