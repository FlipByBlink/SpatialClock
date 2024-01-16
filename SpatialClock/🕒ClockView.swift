import SwiftUI

struct 🕒ClockView: View {
    @EnvironmentObject var model: 📱AppModel
    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { context in
            Text(context.date.formatted(self.format))
                .font(.system(size: self.model.fontSize,
                              weight: self.model.fontWeight.value,
                              design: self.model.fontDesign.value))
                .monospacedDigit()
                .modifier(💾Option.Animation(value: context.date))
                .foregroundStyle(self.model.textColor)
                .padding(.horizontal)
                .padding(.init(self.model.padding))
        }
        .opacity(self.model.opacity)
        .fixedSize()
        .glassBackgroundEffect(displayMode: self.model.hideBackground ? .never : .always)
        .rotation3DEffect(.degrees(.init(self.model.angle)), axis: .x)
        .offset(z: self.model.presentSettingButton ? -50 : 0)
        .onTapGesture { self.showSettingButton() }
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
        if !self.model.hideSecond {
            value = value.second()
        }
        return value
    }
    private func showSettingButton() {
        withAnimation { self.model.presentSettingButton.toggle() }
        Task {
            try? await Task.sleep(for: .seconds(4.5))
            withAnimation(.default.speed(0.4)) {
                self.model.presentSettingButton = false
            }
        }
    }
}
