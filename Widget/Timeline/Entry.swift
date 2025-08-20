import WidgetKit
import SwiftUI

struct 🕒Entry: TimelineEntry {
    let date: Date = .now
    let batteryState = 🔋BatteryState()
}
