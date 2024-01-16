import SwiftUI

struct 🛠️SettingMenu: View {
    @EnvironmentObject var model: 📱AppModel
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.dismissWindow) var dismissWindow
    var body: some View {
        TabView {
            NavigationStack {
                List {
                    Section {
                        Toggle(isOn: self.$model.hideDate) {
                            Label("Hide date", systemImage: "calendar")
                        }
                        Toggle(isOn: self.$model.hideYear) {
                            Label("Hide year", systemImage: "calendar.circle")
                        }
                        .disabled(self.model.hideDate)
                        Toggle(isOn: self.$model.hideWeekday) {
                            Label("Hide weekday", systemImage: "calendar.circle.fill")
                        }
                        .disabled(self.model.hideDate)
                    }
                    Section {
                        Toggle(isOn: self.$model.hideSecond) {
                            Label("Hide second", systemImage: "fitness.timer")
                        }
                    }
                }
                .navigationTitle("Clock setting")
            }
            .tabItem { Label("Clock", systemImage: "clock") }
            NavigationStack {
                List {
                    Picker(selection: self.$model.fontSize) {
                        ForEach(32 ... 180, id: \.self) {
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
                    Toggle(isOn: self.$model.hideBackground) {
                        Label("Hide background", systemImage: "rectangle.slash.fill")
                            .symbolRenderingMode(.hierarchical)
                    }
                    Picker(selection: self.$model.padding) {
                        ForEach(16 ... 64, id: \.self) {
                            Text($0.description)
                        }
                    } label: {
                        Label("Padding size", systemImage: "calendar")
                    }
                    .disabled(self.model.hideBackground)
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
                }
                .navigationTitle("Visual setting")
            }
            .tabItem { Label("Visual", systemImage: "paintbrush") }
            NavigationStack {
                List {
                    Text("時間の精度は前後1秒です。")
                    Text("アニメーションがオンの状態で秒を表示している場合にCPUリソースをある程度消費する可能性があります。")
                    Text("このアプリは共有スペース専用です。フルスペースのアプリを利用している際はこのアプリを利用できません。")
                }
                .navigationTitle("Info")
            }
            .tabItem { Label("Info", systemImage: "info") }
        }
        .frame(maxWidth: 420, maxHeight: 600)
        .onChange(of: self.scenePhase) { _, newValue in
            switch newValue {
                case .background: self.dismissWindow()
                default: break
            }
        }
    }
}

fileprivate extension 🛠️SettingMenu {
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
