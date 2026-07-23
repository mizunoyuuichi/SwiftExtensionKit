import SwiftUI
import SwiftExtensionKit

struct BottomDockMenuExample: View {
    @State private var count = 0
    @State private var value = 0.5

    var body: some View {
        // 背面の他View（コントロール類）の上に、リビール機構を重ねる
        ZStack(alignment: .bottom) {
            DemoBackground()          // 既存の画面（ボタン・スライダ等）
            BottomDockMenu{
                Text("パネル（高さ100px）").font(.headline)
            }
        }
    }
}



struct DemoBackground: View {
    @State private var count = 0
    @State private var value = 0.5

    var body: some View {
        VStack(spacing: 24) {
            Text("背面のView").font(.title2)
            Button("タップ回数: \(count)") { count += 1 }
                .buttonStyle(.borderedProminent)
            Slider(value: $value).padding(.horizontal, 40)
            Spacer()
            Button("下端近くのボタン") { count += 1 }   // 帯のすぐ上：閉じてる間は触れる
                .padding(.bottom, 40)
        }
        .padding(.top, 60)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(white: 0.95))
    }
}



// MARK: - static
extension BottomDockMenuExample {

    static func buildOnViewController() -> UIViewController {
        UIHostingController(rootView: BottomDockMenuExample())
    }
}



#Preview {
    ZStack(alignment: .bottom) {
        Text("メインのコンテンツ").font(.headline)
        BottomDockMenu{
            Text("パネル（高さ100px）").font(.headline)
        }
    }
}
