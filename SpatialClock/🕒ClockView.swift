import SwiftUI

struct 🕒ClockView: View {
    @EnvironmentObject var model: 📱AppModel
    @AppStorage("firstLaunch") var firstLaunch: Bool = true
    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { context in
            HStack {
                Text(context.date.formatted(self.format))
                    .font(.system(size: .init(self.model.fontSize),
                                  weight: self.model.fontWeight.value,
                                  design: self.model.fontDesign.value))
                    .monospacedDigit()
                if self.model.showBattery { 🔋BatteryView() }
            }
            .modifier(💾Option.Animation(value: context.date))
            .foregroundStyle(self.model.textColor)
            .padding(.horizontal)
            .padding(.init(self.model.padding))
        }
        .opacity(self.model.opacity)
        .fixedSize()
        .glassBackgroundEffect(displayMode: self.model.hideBackground ? .never : .always)
        .rotation3DEffect(.degrees(.init(self.model.angle)), axis: .x)
        .modifier(Self.ApplyAnimation())
        .offset(z: self.model.presentSettingButton ? -50 : 0)
        .onTapGesture { self.showSettingButton() }
        .task { self.handleFirstLaunch() }
    }
}

fileprivate extension 🕒ClockView {
    private var format: Date.FormatStyle {
        var value: Date.FormatStyle = .dateTime.hour().minute()
        if !self.model.hideDate {
            value = value.month().day()
            if self.model.showYear {
                value = value.year()
            }
            if !self.model.hideWeekday {
                value = value.weekday()
            }
        }
        if self.model.showSecond {
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
    private struct ApplyAnimation: ViewModifier {
        @EnvironmentObject var model: 📱AppModel
        func body(content: Content) -> some View {
            content
                .animation(.default, value: self.model.hideDate)
                .animation(.default, value: self.model.showYear)
                .animation(.default, value: self.model.hideWeekday)
                .animation(.default, value: self.model.showSecond)
                .animation(.default, value: self.model.fontSize)
                .animation(.default, value: self.model.fontWeight)
                .animation(.default, value: self.model.fontDesign)
                .animation(.default, value: self.model.textColor)
                .animation(.default, value: self.model.padding)
                .animation(.default, value: self.model.angle)
        }
    }
    private func handleFirstLaunch() {
        if self.firstLaunch {
            self.showSettingButton()
            self.firstLaunch = false
        }
    }
}
