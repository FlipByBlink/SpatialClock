import WidgetKit

struct 🕒Entry: TimelineEntry {
    let date: Date = .now
    let batteryState: 🔋BatteryState = .get()
}
