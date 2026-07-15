import SwiftUI
import SwiftExtensionKit

struct InputSheetExample: View {
    @State private var isPresented = false
    @State private var name = ""
    @State private var email = ""
    @State private var notify = true

    var body: some View {
        Button("プロフィール編集") { isPresented = true }
            .sheet(isPresented: $isPresented) {
                NavigationStack {
                    Form {
                        Section("基本情報") {
                            TextField("名前", text: $name)
                            TextField("メール", text: $email)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                        }
                        Section {
                            Toggle("通知を受け取る", isOn: $notify)
                        }
                    }
                    .navigationTitle("プロフィール")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("キャンセル") { isPresented = false }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("保存") {
                                // 保存処理
                                isPresented = false
                            }
                        }
                    }
                }
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
            }
    }
}



// MARK: - static
extension InputSheetExample {

    static func buildOnViewController() -> UIViewController {
        UIHostingController(rootView: InputSheetExample())
    }
}



#Preview {
    InputSheetExample()
}
