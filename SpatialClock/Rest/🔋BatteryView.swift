import SwiftUI

struct 🔋BatteryView: View {
    @EnvironmentObject var model: 🥽AppModel
    private var position: 💾Option.Layout
    private let batteryLevel: Float = Self.getBatteryLevel()
    private let batteryState: UIDevice.BatteryState = Self.getBatteryState()
    var body: some View {
        if self.model.showBattery,
           self.model.batteryPosition == self.position {
            HStack(spacing: 2) {
                if self.position == .left {
                    if self.model.showBatteryNumber {
                        self.batteryNumberView()
                    }
                    self.boltIconView()
                }
                self.batteryIcon()
                    .font(.system(size: .init(self.model.fontSize),
                                  weight: self.model.fontWeight.value,
                                  design: self.model.fontDesign.value))
                if self.position == .right {
                    self.boltIconView()
                    if self.model.showBatteryNumber {
                        self.batteryNumberView()
                    }
                }
            }
            .padding(self.position == .right ? .leading : .trailing,
                     10 + (.init(self.model.fontSize) * 0.35))
        }
    }
    init(_ position: 💾Option.Layout) {
        UIDevice.current.isBatteryMonitoringEnabled = true
        self.position = position
    }
}

private extension 🔋BatteryView {
    private static func getBatteryLevel() -> Float {
#if !targetEnvironment(simulator)
        UIDevice.current.batteryLevel
#else
            .init((1...100).randomElement()!) * 0.01
#endif
    }
    private static func getBatteryState() -> UIDevice.BatteryState {
#if !targetEnvironment(simulator)
        UIDevice.current.batteryState
#else
        Bool.random() ? .charging : .unplugged
#endif
    }
    private func batteryIcon() -> some View {
        switch self.batteryLevel {
            case 0..<0.2: Image(systemName: "battery.0percent")
            case 0.2..<0.4: Image(systemName: "battery.25percent")
            case 0.4..<0.6: Image(systemName: "battery.50percent")
            case 0.6..<0.8: Image(systemName: "battery.75percent")
            case 0.8...1: Image(systemName: "battery.100percent")
            default: Image(systemName: "battery.0percent")
        }
    }
    private func boltIconView() -> some View {
        Group {
            switch self.batteryState {
                case .charging, .full:
                    Image(systemName: "bolt.fill")
                        .font(.system(size: .init(self.model.fontSize) * 0.6,
                                      weight: self.model.fontWeight.value,
                                      design: self.model.fontDesign.value))
                default:
                    EmptyView()
            }
        }
    }
    private func batteryNumberView() -> some View {
        Text((self.batteryLevel * 100).rounded().formatted() + "%")
            .monospacedDigit()
            .font(.system(size: .init(self.model.fontSize),
                          weight: self.model.fontWeight.value,
                          design: self.model.fontDesign.value))
            .lineLimit(1)
            .fixedSize()
    }
}
