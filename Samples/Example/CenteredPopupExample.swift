import SwiftUI
import SwiftExtensionKit

struct CenteredPopupExample: View {
    @State private var isPresented = false
    @State private var name = ""

    var body: some View {
        VStack {
            Button("入力ダイアログを開く") { isPresented = true }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .centeredPopup(isPresented: $isPresented) {
                    VStack(spacing: 16) {
                        Text("名前の登録")
                            .font(.headline)

                        TextField("名前", text: $name)
                            .textFieldStyle(.roundedBorder)

                        HStack {
                            Button("キャンセル", role: .cancel) {
                                isPresented = false
                            }
                            Spacer()
                            Button("保存") {
                                // 保存処理
                                isPresented = false
                            }
                            .buttonStyle(.glassProminent) // iOS 26のガラス調ボタン
                        }
                    }
                    .padding(24)
                    .frame(maxWidth: 320)
                    //.frame(maxWidth: .infinity, maxHeight: .infinity)
                    // iOS 26: Liquid Glass の背景
                    .glassEffect(in: .rect(cornerRadius: 24))
                }
    }
}



// MARK: - static
extension CenteredPopupExample {

    static func buildOnViewController() -> UIViewController {
        UIHostingController(rootView: CenteredPopupExample())
    }
}



#Preview {
    CenteredPopupExample()
}
