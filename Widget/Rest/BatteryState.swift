import WidgetKit
import SwiftUI

struct BatteryState {
    let currentLevel: Self.Level = .get()
    
    enum Level: String {
        case Minimal, Low, Medium, High, Max, unknown
        
        static func get() -> Self {
            UIDevice.current.isBatteryMonitoringEnabled = true
            return switch UIDevice.current.batteryLevel {
                case 0..<0.2: .Minimal
                case 0.2..<0.4: .Low
                case 0.4..<0.6: .Medium
                case 0.6..<0.8: .High
                case 0.8...1: .Max
                default: .unknown
            }
        }
    }
    
    func image() -> Image {
        switch self.currentLevel {
            case .Minimal: .init(systemName: "battery.0percent")
            case .Low: .init(systemName: "battery.25percent")
            case .Medium: .init(systemName: "battery.50percent")
            case .High: .init(systemName: "battery.75percent")
            case .Max: .init(systemName: "battery.100percent")
            case .unknown: .init(systemName: "questionmark")
        }
    }
}
