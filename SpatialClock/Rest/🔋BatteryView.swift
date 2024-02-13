import SwiftUI

struct 🔋BatteryView: View {
    @EnvironmentObject var model: 📱AppModel
    private let batteryLevel: Float = Self.getBatteryLevel()
    var body: some View {
        HStack(spacing: 4) {
            self.batteryIcon()
                .font(.system(size: .init(self.model.fontSize),
                              weight: self.model.fontWeight.value,
                              design: self.model.fontDesign.value))
            Group {
                if self.charging {
                    Image(systemName: "bolt.fill")
                        .imageScale(.small)
                }
                if self.model.showBatteryNumber {
                    Text((self.batteryLevel * 100).rounded().formatted() + "%")
                        .monospacedDigit()
                }
            }
            .font(.system(size: .init(Double(self.model.fontSize) * 0.8),
                          weight: self.model.fontWeight.value,
                          design: self.model.fontDesign.value))
        }
        .padding(.leading, 15 + (.init(self.batteryLevel) * 0.06))
    }
    init() {
        UIDevice.current.isBatteryMonitoringEnabled = true
    }
}

private extension 🔋BatteryView {
    private static func getBatteryLevel() -> Float {
#if !DEBUG
        UIDevice.current.batteryLevel
#else
            .init((1...100).randomElement()!) * 0.01
#endif
    }
    private var charging: Bool {
#if !DEBUG
        switch UIDevice.current.batteryState {
            case .charging, .full: true
            default: false
        }
#else
        .random()
#endif
    }
    private func batteryIcon() -> some View {
        switch self.batteryLevel {
            case 0..<0.2: Image(systemName: "battery.0percent")
            case 0.2..<0.4: Image(systemName: "battery.25percent")
            case 0.4..<0.6: Image(systemName: "battery.50percent")
            case 0.6..<0.8: Image(systemName: "battery.75percent")
            case 0.8...1: Image(systemName: "battery.100percent")
            default: Image(systemName: "ladybug")
        }
    }
}
