import WidgetKit

struct 🕒Provider: TimelineProvider {
    func placeholder(in context: Context) -> 🕒Entry { .init() }
    
    func getSnapshot(in context: Context,
                     completion: @escaping (🕒Entry) -> ()) {
        completion(.init())
    }
    
    func getTimeline(in context: Context,
                     completion: @escaping (Timeline<🕒Entry>) -> ()) {
        let showBatteryOnWidget = UserDefaults.group.bool(forKey: 💾Key.showBatteryOnWidget)
        completion(
            Timeline(
                entries: [.init()],
                policy: showBatteryOnWidget ? .after(.now.addingTimeInterval(60 * 20)) : .never
            )
        )
    }
}
