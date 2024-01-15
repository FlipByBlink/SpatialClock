import SwiftUI

struct SettingView: View {
    @EnvironmentObject var model: AppModel
    var body: some View {
        NavigationStack {
            List {
                Toggle(isOn: self.$model.hideDate) {
                    Label("Hide date", systemImage: "calendar")
                }
                Toggle(isOn: self.$model.hideSecond) {
                    Label("Hide second", systemImage: "fitness.timer")
                }
                Picker(selection: self.$model.timeFontSize) {
                    ForEach(32 ... 200, id: \.self) {
                        Text($0.description)
                    }
                } label: {
                    Label("Time font size", systemImage: "calendar")
                }
                Stepper(value: self.$model.opacity, in: 0.1 ... 1.0, step: 0.1) {
                    LabeledContent {
                        Text(self.model.opacity.formatted())
                            .monospacedDigit()
                    } label: {
                        Label("Opacity", systemImage: "camera.filters")
                    }
                }
                Toggle(isOn: self.$model.hideBackground) {
                    Label("Hide background", systemImage: "rectangle.slash.fill")
                        .symbolRenderingMode(.hierarchical)
                }
                Toggle(isOn: self.$model.hideSettingButton) {
                    Label("Hide setting button", systemImage: "gear")
                }
            }
            .navigationTitle("Setting")
        }
        .frame(maxWidth: 420, maxHeight: 600)
        .onDisappear { self.model.presentSettingWindow = false }
    }
}
