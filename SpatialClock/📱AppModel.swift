import SwiftUI

class 📱AppModel: ObservableObject {
    @Published var presentSettingButton: Bool = false
    @Published var presentSettingWindow: Bool = false
    @Published var hideDate: Bool = false
    @Published var hideSecond: Bool = false
    @Published var fontSize: Int = 100
    @Published var padding: Int = 32
    @Published var hideSettingButton: Bool = false
    @Published var disableAnimation: Bool = false
    @Published var opacity: Double = 1.0
    
    @Published var hideBackground: Bool = false
    @Published var angle: Int = 0
}
