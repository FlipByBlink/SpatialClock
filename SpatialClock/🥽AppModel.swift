import SwiftUI
import Combine

class 🥽AppModel: ObservableObject {
    @Published var isPresentedSettingButton: Bool = false
    @Published var isClosedClockWindow: Bool = false
    
    @AppStorage(💾Key.showYear) var showYear: Bool = false
    @AppStorage(💾Key.hideWeekday) var hideWeekday: Bool = false
    @AppStorage(💾Key.hideDate) var hideDate: Bool = false
    @AppStorage(💾Key.showSecond) var showSecond: Bool = false
    @AppStorage(💾Key.fontSize) var fontSize: Int = 100
    @AppStorage(💾Key.fontWeight) var fontWeight: 💾Option.FontWeight = .bold
    @AppStorage(💾Key.fontDesign) var fontDesign: 💾Option.FontDesign = .default
    @Published var textColor: Color = 💾Option.load()
    @AppStorage(💾Key.padding) var padding: Int = 32
    @AppStorage(💾Key.opacity) var opacity: Double = 1.0
    @AppStorage(💾Key.hideBackground) var hideBackground: Bool = false
    @AppStorage(💾Key.angle) var angle: Int = 0
    @AppStorage(💾Key.animation) var animation: 💾Option.Animation.Case = .disable
    @AppStorage(💾Key.showBattery) var showBattery: Bool = false
    @AppStorage(💾Key.showBatteryNumber) var showBatteryNumber: Bool = false
    @AppStorage(💾Key.tapCountForOpenSettingButton) var tapCountForSettingButton: Int = 1
    @AppStorage(💾Key.customizeDateTimeLayout) var customizeDateTimeLayout: Bool = false
    @AppStorage(💾Key.datePosition) var datePosition: 💾Option.Layout = .left
    @AppStorage(💾Key.spaceBetweenDateAndTime) var spaceBetweenDateAndTime: Int = 0
    @AppStorage(💾Key.batteryPosition) var batteryPosition: 💾Option.Layout = .right
    @AppStorage(💾Key.spaceBetweenClockAndBattery) var spaceBetweenClockAndBattery: Int = 0
    
    @AppStorage(💾Key.showYearOnWidget, store: .group)
    var showYearOnWidget: Bool = false
    @AppStorage(💾Key.hideWeekdayOnWidget, store: .group)
    var hideWeekdayOnWidget: Bool = false
    @AppStorage(💾Key.hideDateOnWidget, store: .group)
    var hideDateOnWidget: Bool = false
    @AppStorage(💾Key.showSecondOnWidget, store: .group)
    var showSecondOnWidget: Bool = false
    @AppStorage(💾Key.fontSizeOnWidget, store: .group)
    var fontSizeOnWidget: Int = 16
    @AppStorage(💾Key.fontWeightOnWidget, store: .group)
    var fontWeightOnWidget: 💾Option.FontWeight = .bold
    @AppStorage(💾Key.fontDesignOnWidget, store: .group)
    var fontDesignOnWidget: 💾Option.FontDesign = .default
    @AppStorage(💾Key.opacityOnWidget, store: .group)
    var opacityOnWidget: Double = 1.0
    @AppStorage(💾Key.spaceBetweenLinesOnWidget, store: .group)
    var spaceBetweenLinesOnWidget: Int = 8
    @AppStorage(💾Key.alignmentOnWidget, store: .group)
    var alignmentOnWidget: 💾Option.AlignmentOnWidget = .default
    @AppStorage(💾Key.showBatteryOnWidget, store: .group)
    var showBatteryOnWidget: Bool = false
    @AppStorage(💾Key.batteryLabelStyleOnWidget, store: .group)
    var batteryLabelStyleOnWidget: 💾Option.BatteryLabelStyleOnWidget = .default
}
