import SwiftUI

struct 🛠️VisualTab: View {
    @EnvironmentObject var model: 📱AppModel
    var body: some View {
        NavigationStack {
            List {
                Picker(selection: self.$model.fontSize) {
                    ForEach(24 ... 170, id: \.self) {
                        Text($0.description)
                    }
                } label: {
                    Label("Font size", systemImage: "calendar")
                }
                Picker(selection: self.$model.fontWeight) {
                    ForEach(💾Option.FontWeight.allCases) {
                        Text($0.label)
                            .font(.system(.body, weight: $0.value))
                    }
                } label: {
                    Label("Font weight", systemImage: "bold")
                }
                Picker(selection: self.$model.fontDesign) {
                    ForEach(💾Option.FontDesign.allCases) {
                        Text($0.label)
                            .font(.system(.body, design: $0.value))
                    }
                } label: {
                    Label("Font design", systemImage: "paintbrush.pointed")
                }
                Self.TextColorPicker()
                Stepper(value: self.$model.opacity, in: 0.5 ... 1.0, step: 0.1) {
                    LabeledContent {
                        Text(self.model.opacity.formatted())
                            .monospacedDigit()
                    } label: {
                        Label("Opacity", systemImage: "camera.filters")
                    }
                }
                Picker(selection: self.$model.angle) {
                    ForEach(-90 ... 90, id: \.self) {
                        Text($0.description)
                    }
                } label: {
                    Label("Angle", systemImage: "angle")
                }
                Picker(selection: self.$model.animation) {
                    ForEach(💾Option.Animation.Case.allCases) {
                        Text($0.label)
                    }
                } label: {
                    Label("Animation", systemImage: "circle.dotted.and.circle")
                }
                Section {
                    Toggle(isOn: self.$model.hideBackground) {
                        Label("Hide background", systemImage: "rectangle.slash.fill")
                            .symbolRenderingMode(.hierarchical)
                    }
                    Picker(selection: self.$model.padding) {
                        ForEach(8 ... 64, id: \.self) {
                            Text($0.description)
                        }
                    } label: {
                        Label("Padding size", systemImage: "calendar")
                            .opacity(self.model.hideBackground ? 0.6 : 1)
                            .animation(.default, value: self.model.hideBackground)
                    }
                    .disabled(self.model.hideBackground)
                }
            }
            .navigationTitle("Visual setting")
        }
        .tabItem { Label("Visual", systemImage: "paintbrush") }
    }
}

private extension 🛠️VisualTab {
    private struct TextColorPicker: View {
        @EnvironmentObject var model: 📱AppModel
        var body: some View {
            ColorPicker(selection: self.$model.textColor, supportsOpacity: false) {
                Label("Text color", systemImage: "paintpalette")
            }
            .onChange(of: self.model.textColor) { _, newValue in
                💾Option.save(newValue)
            }
        }
    }
}
