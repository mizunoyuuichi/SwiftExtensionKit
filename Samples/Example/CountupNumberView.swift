import SwiftUI
import SwiftExtensionKit

struct CountupNumberView: View {
    @State private var animatedValue: Double = 0
    let targetValue: Double = 4567
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("今期  \( Text("(~12/01)").asCaption() )  までの利息金額　¥").asBody()
                CountupNumberText(value: animatedValue) { $0.asHead() }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 45)
            
            

            Button("スタート") {
                animatedValue = 0 // 一度戻す
                withAnimation(.easeOut(duration: 1.111)) {
                    animatedValue = targetValue
                }
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1.111)) {
                animatedValue = targetValue
            }
        }
    }
}


// MARK: - static
extension CountupNumberView {

    static func buildOnViewController() -> UIViewController {
        UIHostingController(rootView: CountupNumberView())
    }
}



// MARK: - public
extension CountupNumberView {

}



// MARK: - private
extension CountupNumberView {

}



#Preview {
    CountupNumberView()
}
