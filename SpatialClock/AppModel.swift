import SwiftUI

class AppModel: ObservableObject {
    @Published var presentSettingWindow: Bool = false
    @Published var hideDate: Bool = false
    @Published var hideSecond: Bool = false
    @Published var timeFontSize: Int = 100
    @Published var hideBackground: Bool = false
    @Published var hideSettingButton: Bool = false
    @Published var opacity: Double = 1.0
}
