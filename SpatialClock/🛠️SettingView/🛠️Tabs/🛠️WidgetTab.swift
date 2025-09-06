import SwiftUI
import WidgetKit

struct 🛠️WidgetTab: View {
    @EnvironmentObject var model: 🥽AppModel
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Toggle(isOn: self.$model.hideDateOnWidget) {
                        Label("Hide date", systemImage: "calendar")
                    }
                    Group {
                        Toggle(isOn: self.$model.showYearOnWidget) {
                            Label("Show year", systemImage: "calendar.circle")
                                .opacity(self.model.hideDateOnWidget ? 0.8 : 1)
                        }
                        Toggle(isOn: self.$model.hideWeekdayOnWidget) {
                            Label("Hide weekday", systemImage: "calendar.circle.fill")
                                .opacity(self.model.hideDateOnWidget ? 0.8 : 1)
                        }
                    }
                    .disabled(self.model.hideDateOnWidget)
                    .animation(.default, value: self.model.hideDateOnWidget)
                }
                Section {
                    Toggle(isOn: self.$model.showSecondOnWidget) {
                        Label("Show second", systemImage: "fitness.timer")
                    }
                }
                Section {
                    Picker(selection: self.$model.fontSizeOnWidget) {
                        ForEach(10 ... 170, id: \.self) { Text($0.formatted()) }
                    } label: {
                        Label("Font size", systemImage: "calendar")
                    }
                    Picker(selection: self.$model.fontWeightOnWidget) {
                        ForEach(💾Option.FontWeight.allCases) {
                            Text($0.label)
                                .font(.system(.body, weight: $0.value))
                        }
                    } label: {
                        Label("Font weight", systemImage: "bold")
                    }
                    Picker(selection: self.$model.fontDesignOnWidget) {
                        ForEach(💾Option.FontDesign.allCases) {
                            Text($0.label)
                                .font(.system(.body, design: $0.value))
                        }
                    } label: {
                        Label("Font design", systemImage: "paintbrush.pointed")
                    }
                    LabeledContent {
                        HStack {
                            Text(self.model.opacityOnWidget.formatted())
                                .monospacedDigit()
                            Stepper("Opacity", value: self.$model.opacityOnWidget, in: 0.3 ... 1.0, step: 0.1)
                                .labelsHidden()
                        }
                    } label: {
                        Label("Opacity", systemImage: "camera.filters")
                    }
                    Picker(selection: self.$model.spaceBetweenLinesOnWidget) {
                        ForEach(0...24, id: \.self) { Text($0.formatted()) }
                    } label: {
                        Label("Space between lines", systemImage: "lines.measurement.vertical")
                    }
                    Picker(selection: self.$model.alignmentOnWidget) {
                        ForEach(💾Option.AlignmentOnWidget.allCases) { Text($0.rawValue) }
                    } label: {
                        Label("Alignment", systemImage: "align.horizontal.left")
                    }
                }
                Section {
                    Toggle(isOn: self.$model.showBatteryOnWidget) {
                        Label("Show battery on widget", systemImage: "battery.100percent")
                    }
                    Picker(selection: self.$model.batteryLabelStyleOnWidget) {
                        ForEach(💾Option.BatteryLabelStyleOnWidget.allCases) { Text($0.rawValue) }
                    } label: {
                        Label("Battery label style", systemImage: "percent")
                    }
                }
            }
            .navigationTitle("Widget setting")
            .modifier(Self.ReloadWidget())
        }
        .tabItem { Label("Widget", systemImage: "slider.horizontal.2.square") }
    }
}

private extension 🛠️WidgetTab {
    private struct ReloadWidget: ViewModifier {
        @EnvironmentObject var model: 🥽AppModel
        func body(content: Content) -> some View {
            content
                .onChange(of: self.model.showYearOnWidget) { Self.reload() }
                .onChange(of: self.model.showYearOnWidget) { Self.reload() }
                .onChange(of: self.model.hideWeekdayOnWidget) { Self.reload() }
                .onChange(of: self.model.hideDateOnWidget) { Self.reload() }
                .onChange(of: self.model.showSecondOnWidget) { Self.reload() }
                .onChange(of: self.model.fontSizeOnWidget) { Self.reload() }
                .onChange(of: self.model.fontWeightOnWidget) { Self.reload() }
                .onChange(of: self.model.fontDesignOnWidget) { Self.reload() }
                .onChange(of: self.model.opacityOnWidget) { Self.reload() }
                .onChange(of: self.model.spaceBetweenLinesOnWidget) { Self.reload() }
                .onChange(of: self.model.alignmentOnWidget) { Self.reload() }
                .onChange(of: self.model.showBatteryOnWidget) { Self.reload() }
                .onChange(of: self.model.batteryLabelStyleOnWidget) { Self.reload() }
        }
        private static func reload() {
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
}
