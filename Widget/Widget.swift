import WidgetKit
import SwiftUI

@main
struct 🕒Widget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "kind", provider: 🕒Provider()) {
            🕒EntryView(entry: $0)
        }
        .supportedFamilies([.systemSmall,
                            .systemMedium,
                            .systemLarge,
                            .systemExtraLarge,
                            .systemExtraLargePortrait])
        .supportedMountingStyles([.elevated, .recessed])
        .widgetTexture(.paper)
        .configurationDisplayName("Clock widget")
        .description("Clock, date, battery.")
    }
}
