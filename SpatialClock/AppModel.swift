import SwiftUI

class AppModel: ObservableObject {
    @Published var presentSettingWindow: Bool = false
    @Published var hideDate: Bool = false
}
