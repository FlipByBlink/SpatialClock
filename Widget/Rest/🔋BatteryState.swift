import WidgetKit
import SwiftUI

enum 🔋BatteryState: String {
    case Minimal,
         Low,
         Medium,
         High,
         Charged,
         Full,
         unknown
}

extension 🔋BatteryState {
    static func get() -> Self {
        UIDevice.current.isBatteryMonitoringEnabled = true
        return switch UIDevice.current.batteryLevel {
            case 0..<0.2: .Minimal
            case 0.2..<0.4: .Low
            case 0.4..<0.6: .Medium
            case 0.6..<0.8: .High
            case 0.8..<1: .Charged
            case 1: .Full
            default: .unknown
        }
    }
    
    func image() -> Image {
        switch self {
            case .Minimal: .init(systemName: "battery.0percent")
            case .Low: .init(systemName: "battery.25percent")
            case .Medium: .init(systemName: "battery.50percent")
            case .High: .init(systemName: "battery.75percent")
            case .Charged, .Full: .init(systemName: "battery.100percent")
            case .unknown: .init(systemName: "questionmark")
        }
    }
    
    func label(_ style: 💾Option.BatteryLabelStyleOnWidget) -> String {
        switch style {
            case .default:
                self.rawValue
            case .lowercase:
                self.rawValue.lowercased()
            case .numbarPlus:
                switch self {
                    case .Minimal: "0+%"
                    case .Low: "20+%"
                    case .Medium: "40+%"
                    case .High: "60+%"
                    case .Charged: "80+%"
                    case .Full: "100%"
                    case .unknown: "??%"
                }
            case .japaneseStyle:
                switch self {
                    case .Minimal: "ほぼ無し"
                    case .Low: "少なめ"
                    case .Medium: "中くらい"
                    case .High: "多め"
                    case .Charged: "ほぼフル"
                    case .Full: "フル"
                    case .unknown: "アンノウン"
                }
            case .nothing:
                ""
        }
    }
}
