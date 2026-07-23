import SwiftUI



struct BottomDockMenuExample: View {
    @State private var count = 0
    @State private var value = 0.5

    var body: some View {
        // 背面の他View（コントロール類）の上に、リビール機構を重ねる
        ZStack(alignment: .bottom) {
            DemoBackground()          // 既存の画面（ボタン・スライダ等）
            BottomDockMenu()     // 最前面の開閉機構
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



struct BottomDockMenu: View {

    @State private var isAppear = false
    private let kGestureHeight: CGFloat = 30
    private let kDockHeight   : CGFloat = 100
    private let kDockHiddenOffset: CGFloat = 240
    private let dockAnimation = Animation.interpolatingSpring(stiffness: 260, damping: 28)

    var body: some View {
        ZStack(alignment: .bottom) {
            if isAppear {
                Rectangle()
                    .fill(.ultraThinMaterial.opacity(0.9).blendMode(.multiply))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture { toggleDock() }

                VStack {
                    Text("パネル（高さ100px）").font(.headline)
                }
                .frame(maxWidth: .infinity)
                .frame(height: kDockHeight)
                .background(Color.blue.opacity(0.9))
                .clipShape(RoundedRectangle(cornerRadius: 36, style: .continuous))
                .shadow(color: .black.opacity(0.18), radius: 16, y: -4)
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                .contentShape(Rectangle())
                .onTapGesture { toggleDock() }
                .transition(
                    .asymmetric(
                        insertion: .offset(y: kDockHiddenOffset),
                        removal: .offset(y: kDockHiddenOffset)
                    )
                )
            }
            else {
                Color.clear
                    .frame(maxWidth: .infinity)
                    .frame(height: kGestureHeight)
                    .contentShape(Rectangle())
                    .onTapGesture { toggleDock() }
                    .ignoresSafeArea()
            }
        }
        .ignoresSafeArea()
        .animation(dockAnimation, value: isAppear)
    }

    private func toggleDock() {
        withAnimation(dockAnimation) {
            isAppear.toggle()
        }
    }
}



#Preview {
    BottomDockMenu()
}
