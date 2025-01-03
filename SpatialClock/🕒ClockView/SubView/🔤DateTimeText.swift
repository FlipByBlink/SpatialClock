import SwiftUI

struct 🔤DateTimeText: View {
    @EnvironmentObject var model: 🥽AppModel
    var date: Date
    var body: some View {
        Group {
            if self.model.customizeDateTimeLayout, !self.model.hideDate {
                self.customizeLayoutView()
            } else {
                Text(self.defaultString)
            }
        }
        .font(.system(size: .init(self.model.fontSize),
                      weight: self.model.fontWeight.value,
                      design: self.model.fontDesign.value))
        .monospacedDigit()
        .lineLimit(1)
        .fixedSize()
    }
    init(_ date: Date) {
        self.date = date
    }
}

private extension 🔤DateTimeText {
    private var defaultString: String {
        Date.FormatStyle
            .dateTime
            .hour()
            .minute()
            .second(self.model.showSecond ? .defaultDigits : .omitted)
            .month(self.model.hideDate ? .omitted : .abbreviated)
            .day(self.model.hideDate ? .omitted : .defaultDigits)
            .year(!self.model.hideDate && self.model.showYear ? .defaultDigits : .omitted)
            .weekday(!self.model.hideDate && !self.model.hideWeekday ? .abbreviated : .omitted)
            .format(self.date)
    }
    private func customizeLayoutView() -> some View {
        HStack(spacing: 💾Option.space(self.model.fontSize, self.model.spaceBetweenDateAndTime)) {
            self.customizeLayoutDateView(.left)
            Text(
                Date.FormatStyle
                    .dateTime
                    .hour()
                    .minute()
                    .second(self.model.showSecond ? .defaultDigits : .omitted)
                    .format(self.date)
            )
            self.customizeLayoutDateView(.right)
        }
    }
    private func customizeLayoutDateView(_ position: 💾Option.Layout) -> some View {
        Group {
            if self.model.datePosition == position {
                Text(
                    Date.FormatStyle
                        .dateTime
                        .month()
                        .day()
                        .year(self.model.showYear ? .defaultDigits : .omitted)
                        .weekday(self.model.hideWeekday ? .omitted : .abbreviated)
                        .format(self.date)
                )
            }
        }
    }
}
