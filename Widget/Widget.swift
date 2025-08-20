import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry { .init() }
    
    func getSnapshot(in context: Context,
                     completion: @escaping (SimpleEntry) -> ()) {
        completion(.init())
    }
    
    func getTimeline(in context: Context,
                     completion: @escaping (Timeline<Entry>) -> ()) {
        completion(
            Timeline(entries: [.init()],
                     policy: .after(.now.addingTimeInterval(60 * 20)))
        )
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date = .now
    let batteryState = BatteryState()
}

struct ClockWidgetEntryView: View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack(spacing: 8) {
            //Text(TimeDataSource<Date>.currentDate, format: .dateTime)
            Text(.currentDate, format: .dateTime.year())
            Text(.currentDate, format: .dateTime.month().day().weekday())
            Text(.currentDate, format: .dateTime.hour().minute().second())
            HStack(alignment: .firstTextBaseline, spacing: 6) {
                self.entry.batteryState.image()
                Text(self.entry.batteryState.currentLevel.rawValue)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
            }
        }
        //.multilineTextAlignment(.center)
        .monospacedDigit()
        .font(.system(size: 20, weight: .bold))
    }
}

@main
struct ClockWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "ClockWidget", provider: Provider()) {
            ClockWidgetEntryView(entry: $0)
                .containerBackground(.background, for: .widget)
        }
        .supportedFamilies([
            .systemSmall,
            .systemMedium,
            .systemLarge,
            .systemExtraLarge,
            .systemExtraLargePortrait
        ])
        .supportedMountingStyles([.elevated, .recessed])
        .widgetTexture(.paper)
        .configurationDisplayName("Clock widget")
        .description("Clock, date, battery.")
    }
}
