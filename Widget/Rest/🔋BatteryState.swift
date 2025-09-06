import WidgetKit
import SwiftUI

enum 🔋BatteryState: String {
    case Minimal,
         Low,
         Medium,
         High,
         Charged,
         Full,
         Unknown
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
            default: .Unknown
        }
    }
    
    func image() -> Image {
        switch self {
            case .Minimal: .init(systemName: "battery.0percent")
            case .Low: .init(systemName: "battery.25percent")
            case .Medium: .init(systemName: "battery.50percent")
            case .High: .init(systemName: "battery.75percent")
            case .Charged, .Full: .init(systemName: "battery.100percent")
            case .Unknown: .init(systemName: "questionmark")
        }
    }
    
    func label(_ style: 💾Option.BatteryLabelStyleOnWidget) -> String {
        switch style {
            case .default:
                switch self {
                    case .Minimal: "0+%"
                    case .Low: "20+%"
                    case .Medium: "40+%"
                    case .High: "60+%"
                    case .Charged: "80+%"
                    case .Full: "100%"
                    case .Unknown: "??%"
                }
            case .Uppercase:
                self.rawValue
            case .lowercase:
                self.rawValue.lowercased()
            case .Japanese:
                switch self {
                    case .Minimal: "ほぼ無し"
                    case .Low: "少なめ"
                    case .Medium: "中くらい"
                    case .High: "多め"
                    case .Charged: "ほぼフル"
                    case .Full: "フル"
                    case .Unknown: "アンノウン"
                }
            case .Nothing:
                ""
        }
    }
    
    static var validCases: [Self] {
        [.Minimal,
         .Low,
         .Medium,
         .High,
         .Charged,
         .Full,]
    }
    
    var rangeLabel: String {
        switch self {
            case .Minimal: "0, 5, 10, 15"
            case .Low: "20, 25, 30, 35"
            case .Medium: "40, 45, 50, 55"
            case .High: "60, 65, 70, 75"
            case .Charged: "80, 85, 90, 95"
            case .Full: "100"
            case .Unknown: "??%"
        }
    }
}
