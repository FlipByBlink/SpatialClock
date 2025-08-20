import WidgetKit
import SwiftUI

struct 🕒Provider: TimelineProvider {
    func placeholder(in context: Context) -> 🕒Entry { .init() }
    
    func getSnapshot(in context: Context,
                     completion: @escaping (🕒Entry) -> ()) {
        completion(.init())
    }
    
    func getTimeline(in context: Context,
                     completion: @escaping (Timeline<🕒Entry>) -> ()) {
        completion(
            Timeline(entries: [.init()],
                     policy: .after(.now.addingTimeInterval(60 * 20)))
        )
    }
}
