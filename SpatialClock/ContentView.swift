import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: 🥽AppModel
    var body: some View {
        🕒ClockView()
            .ornament(
                visibility: self.model.presentSettingButton ? .visible : .hidden,
                attachmentAnchor: .scene(.bottom)
            ) {
                🛠️SettingButton()
            }
            .volumeBaseplateVisibility(.hidden)
            .supportedVolumeViewpoints(.front)
            .persistentSystemOverlays(.hidden)
    }
}
