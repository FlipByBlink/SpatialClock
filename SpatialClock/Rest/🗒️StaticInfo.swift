import SwiftUI

enum 🗒️StaticInfo {
    static let appName: LocalizedStringResource = "SpatialClock"
    static var appSubTitle: LocalizedStringResource { "for Apple Vision Pro" }
    
    static let appStoreProductURL: URL = .init(string: "https://apps.apple.com/app/id6476141176")!
    static var appStoreUserReviewURL: URL { .init(string: "\(Self.appStoreProductURL)?action=write-review")! }
    
    static var contactAddress: String { "seemly-blanker-0b@icloud.com" }
    
    static let privacyPolicyDescription = """
        2024-02-02
        
        
        English
        
        This application doesn't collect user information.
        
        
        日本語(Japanese)
        
        このアプリ自身において、ユーザーの情報を一切収集しません。
        """
    
    static let webRepositoryURL: URL = .init(string: "https://github.com/FlipByBlink/SpatialClock")!
    static let webMirrorRepositoryURL: URL = .init(string: "https://gitlab.com/FlipByBlink/SpatialClock_Mirror")!
}

extension 🗒️StaticInfo {
    static let versionInfos: [(version: String, date: String)] = [
        ("2.0", "2025-09-09"),
        ("1.3", "2025-01-04"),
        ("1.2", "2024-06-30"),
        ("1.1.1", "2024-03-02"),
        ("1.1", "2024-02-14"),
        ("1.0", "2024-02-02")
    ] //降順。先頭の方が新しい
    
    enum SourceCodeCategory: String, CaseIterable, Identifiable {
        case main, ClockView, SettingView, Option, Rest, Widget
        var id: Self { self }
        var fileNames: [String] {
            switch self {
                case .main: [
                    "App.swift",
                    "ContentView.swift",
                    "🥽AppModel.swift",
                ]
                case .ClockView: [
                    "🕒ClockView.swift",
                    "🔤DateTimeText.swift",
                    "🔋BatteryView.swift",
                ]
                case .SettingView: [
                    "🛠️SettingButton.swift",
                    "🛠️SettingMenu.swift",
                    "🛠️ClockTab.swift",
                    "🛠️VisualTab.swift",
                    "🛠️RestTab.swift",
                    "🛠️WidgetTab.swift",
                    "🛠️TipsTab.swift",
                    "🛠️AboutTab.swift",
                    "🛠️RequestTab.swift",
                ]
                case .Option: [
                    "💾Option.swift",
                    "💾Key.swift",
                    "UserDefaults+Extension.swift",
                ]
                case .Rest: [
                    "🗒️StaticInfo.swift",
                    "ℹ️AboutApp.swift"
                ]
                case .Widget: [
                    "Widget.swift",
                    "Provider.swift",
                    "Entry.swift",
                    "View.swift",
                    "🔋BatteryState.swift",
                ]
            }
        }
    }
}
