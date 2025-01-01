import SwiftUI

struct 🕒ClockView: View {
    @EnvironmentObject var model: 🥽AppModel
    @AppStorage("firstLaunch") private var firstLaunch: Bool = true
    @State private var taskToDisappearSettingButton: Task<Void, Never>? = nil
    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { context in
            HStack(spacing: 0) {
                🔋BatteryView(.left)
                🕒ClockText(date: context.date)
                🔋BatteryView(.right)
            }
            .environment(\.layoutDirection, .leftToRight)
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
        .onTapGesture(count: self.model.tapCountForSettingButton) { self.showSettingButton() }
        .task { self.handleFirstLaunch() }
        .onDisappear { self.model.isClosedClockWindow = true }
    }
}

private extension 🕒ClockView {
    private func showSettingButton() {
        if !self.model.isPresentedSettingButton {
            withAnimation { self.model.isPresentedSettingButton = true }
            self.taskToDisappearSettingButton = Task {
                try? await Task.sleep(for: .seconds(4.5))
                withAnimation(.default.speed(0.4)) {
                    self.model.isPresentedSettingButton = false
                }
            }
        } else {
            withAnimation { self.model.isPresentedSettingButton = false }
            self.taskToDisappearSettingButton?.cancel()
            self.taskToDisappearSettingButton = nil
        }
    }
    private struct ApplyAnimation: ViewModifier {
        @EnvironmentObject var model: 🥽AppModel
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
