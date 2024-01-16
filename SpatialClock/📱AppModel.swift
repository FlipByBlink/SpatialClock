import SwiftUI

class 📱AppModel: ObservableObject {
    @AppStorage(💾Key.presentSettingButton) var presentSettingButton: Bool = false
    @AppStorage(💾Key.presentSettingWindow) var presentSettingWindow: Bool = false
    @AppStorage(💾Key.hideYear) var hideYear: Bool = false
    @AppStorage(💾Key.hideWeekday) var hideWeekday: Bool = false
    @AppStorage(💾Key.hideDate) var hideDate: Bool = false
    @AppStorage(💾Key.hideSecond) var hideSecond: Bool = false
    @AppStorage(💾Key.fontSize) var fontSize: Int = 100
    @AppStorage(💾Key.fontWeight) var fontWeight: 💾Option.FontWeight = .bold
    @AppStorage(💾Key.fontDesign) var fontDesign: 💾Option.FontDesign = .default
    @AppStorage(💾Key.textColor) var textColor: 💾Option.Color = .init(.yellow)
    @AppStorage(💾Key.padding) var padding: Int = 32
    @AppStorage(💾Key.disableAnimation) var disableAnimation: Bool = false
    @AppStorage(💾Key.opacity) var opacity: Double = 1.0
    @AppStorage(💾Key.hideBackground) var hideBackground: Bool = false
    @AppStorage(💾Key.angle) var angle: Int = 0
}
