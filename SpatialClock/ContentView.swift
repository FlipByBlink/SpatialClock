import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Text(.now, style: Text.DateStyle.date)
                Text(.now, style: Text.DateStyle.time)
            }
            .font(.system(size: 100, weight: .bold))
        }
        .padding()
    }
}
