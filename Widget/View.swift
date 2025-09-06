import WidgetKit
import SwiftUI

struct 🕒EntryView: View {
    var entry: 🕒Provider.Entry
    
    @StateObject private var model = 🥽AppModel()
    
    var body: some View {
        VStack(
            alignment: self.model.alignmentOnWidget.vstackValue,
            spacing: .init(self.model.spaceBetweenLinesOnWidget)
        ) {
            if !self.model.hideDateOnWidget {
                if self.model.showYearOnWidget {
                    Text(.currentDate, format: .dateTime.year())
                }
                Text(
                    .currentDate,
                    format: .dateTime
                        .month()
                        .day()
                        .weekday(self.model.hideWeekdayOnWidget ? .omitted : .abbreviated)
                )
            }
            Text(
                .currentDate,
                format: .dateTime
                    .hour()
                    .minute()
                    .second(self.model.showSecondOnWidget ? .defaultDigits : .omitted)
            )
            if self.model.showBatteryOnWidget {
                HStack(alignment: .firstTextBaseline, spacing: 6) {
                    self.entry.batteryState.image()
                    Text(self.entry.batteryState.label(self.model.batteryLabelStyleOnWidget))
                }
            }
        }
        .multilineTextAlignment(self.model.alignmentOnWidget.multilineValue)
        .font(.system(size: .init(self.model.fontSizeOnWidget),
                      weight: self.model.fontWeightOnWidget.value,
                      design: self.model.fontDesignOnWidget.value))
        .monospacedDigit()
        .opacity(self.model.opacityOnWidget)
        .containerBackground(.background, for: .widget)
    }
}
