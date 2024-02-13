import SwiftUI

struct 🔋BatteryView: View {
    @EnvironmentObject var model: 📱AppModel
    var body: some View {
        self.contentView(UIDevice.current.batteryLevel)
    }
    init() {
        UIDevice.current.isBatteryMonitoringEnabled = true
    }
}

private extension 🔋BatteryView {
    private func contentView(_ value: Float) -> some View {
        HStack(spacing: 1) {
            self.batteryIcon(value)
                .imageScale(.small)
                .font(.system(size: .init(self.model.fontSize),
                              weight: self.model.fontWeight.value,
                              design: self.model.fontDesign.value))
            Group {
                if self.charging {
                    Image(systemName: "bolt.fill")
                        .imageScale(.small)
                }
                Text((value * 100).rounded().formatted() + "%")
                    .monospacedDigit()
            }
            .font(.system(size: .init(Double(self.model.fontSize) * 0.7),
                          weight: self.model.fontWeight.value,
                          design: self.model.fontDesign.value))
        }
    }
    private var charging: Bool {
        switch UIDevice.current.batteryState {
            case .charging, .full: true
            default: false
        }
    }
    private func batteryIcon(_ value: Float) -> some View {
        switch value {
            case 0..<0.2: Image(systemName: "battery.0percent")
            case 0.2..<0.4: Image(systemName: "battery.25percent")
            case 0.4..<0.6: Image(systemName: "battery.50percent")
            case 0.6..<0.8: Image(systemName: "battery.75percent")
            case 0.8...1: Image(systemName: "battery.100percent")
            default: Image(systemName: "ladybug")
        }
    }
    private var batteryState: String {
        switch UIDevice.current.batteryState {
            case .unknown: ".unknown"
            case .unplugged: ".unplugged"
            case .charging: ".charging"
            case .full: ".full"
            @unknown default: "@unknown"
        }
    }
}
