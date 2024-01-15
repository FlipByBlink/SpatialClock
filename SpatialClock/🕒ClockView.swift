import SwiftUI

struct 🕒ClockView: View {
    @EnvironmentObject var model: 📱AppModel
    var body: some View {
        TimelineView(.animation) { context in
            Text(context.date.formatted(self.format))
                .font(.system(size: .init(self.model.fontSize),
                              weight: .bold))
                .monospacedDigit()
                .contentTransition(.numericText())
                .animation(.default, value: context.date)
                .padding(.horizontal)
                .padding(.init(self.model.padding))
        }
        .animation(.default, value: self.model.hideDate)
        .opacity(self.model.opacity)
        .fixedSize()
        .opacity(self.model.presentSettingButton ? 0.3 : 1)
        .glassBackgroundEffect(displayMode: self.model.hideBackground ? .never : .always)
        .offset(z: self.model.presentSettingButton ? -20 : 0)
        .onTapGesture {
            if !self.model.presentSettingWindow {
                withAnimation { self.model.presentSettingButton.toggle() }
            }
        }
    }
}

fileprivate extension 🕒ClockView {
    private var format: Date.FormatStyle {
        var value: Date.FormatStyle = .dateTime.hour().minute()
        if !self.model.hideDate {
            value = value.month().day()
            if !self.model.hideYear {
                value = value.year()
            }
            if !self.model.hideWeekday {
                value = value.weekday()
            }
        }
        if self.model.hideSecond {
            value = value.second()
        }
        return value
    }
}
