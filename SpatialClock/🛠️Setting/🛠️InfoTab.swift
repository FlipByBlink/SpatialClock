import SwiftUI

struct 🛠️InfoTab: View {
    var body: some View {
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
}
