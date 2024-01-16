import SwiftUI

struct 🕒ClockView: View {
    @EnvironmentObject var model: 📱AppModel
    var body: some View {
        /// CPU消費を抑えるために1秒毎に更新
        TimelineView(.periodic(from: .now + 1, by: 1)) { context in
            Text(context.date.formatted(self.format))
                .font(.system(size: .init(self.model.fontSize),
                              weight: self.model.fontWeight.value,
                              design: self.model.fontDesign.value))
                .monospacedDigit()
                .modifier(💾Option.Animation.Modifier(value: context.date))
                .foregroundStyle(self.model.textColor)
                .padding(.horizontal)
                .padding(.init(self.model.padding))
        }
        .opacity(self.model.opacity)
        .fixedSize()
        .glassBackgroundEffect(displayMode: self.model.hideBackground ? .never : .always)
        .rotation3DEffect(.degrees(.init(self.model.angle)), axis: .x)
        .offset(z: self.model.presentSettingButton ? -20 : 0)
        .onTapGesture {
            withAnimation { self.model.presentSettingButton.toggle() }
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
        if !self.model.hideSecond {
            value = value.second()
        }
        return value
    }
}
