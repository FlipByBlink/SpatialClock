import WidgetKit
import SwiftUI

struct 🕒EntryView: View {
    var entry: 🕒Provider.Entry
    
    var body: some View {
        VStack(spacing: 8) {
            Text(.currentDate, format: .dateTime.year())
            Text(.currentDate, format: .dateTime.month().day().weekday())
            Text(.currentDate, format: .dateTime.hour().minute().second())
            HStack(alignment: .firstTextBaseline, spacing: 6) {
                self.entry.batteryState.image()
                Text(self.entry.batteryState.rawValue)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
            }
        }
        //.multilineTextAlignment(.center)
        .monospacedDigit()
        .font(.system(size: 20, weight: .bold))
        .containerBackground(.background, for: .widget)
    }
}
