import SwiftUI
import SwiftExtensionKit

struct AnimationNumberView: View {
    @State private var animatedValue: Double = 0
    let targetValue: Double = 4567
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("今期  \( Text("(~12/01)").asCaption() )  までの利息金額　¥").asBody()
                AnimateNumberText(value: animatedValue) { $0.asHead() }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 45)
            
            

            Button("スタート") {
                animatedValue = 0 // 一度戻す
                withAnimation(.easeOut(duration: 0.111)) {
                    animatedValue = targetValue
                }
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.111)) {
                animatedValue = targetValue
            }
        }
    }
}


// MARK: - static
extension AnimationNumberView {

    static func buildOnViewController() -> UIViewController {
        UIHostingController(rootView: AnimationNumberView())
    }
}



// MARK: - public
extension AnimationNumberView {

}


// MEMO: Textを失わざるおえない難点があり、ある程度HStackなどで回避してもらう制約がある
//       ( Text ではなく Viewになってしまうため )
struct AnimateNumberText: View, Animatable {
    
    var value: Double
    var style: (Text) -> Text = { $0 }
    
    var animatableData: Double { // NOTE: Animatableプロトコルの要件としてこの名称である必要
        get { value }
        set { value = newValue }
    }
    
    var body: some View {
        //Text("今期  \( Text("(~12/01)").asCaption() )  までの利息金額　¥\(Text("\(Int(value))").asHead()) ")
        
//        Text("\(Int(value))")
//            .asBody()
//            .contentTransition(.identity)
//            .monospacedDigit()
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding(.leading, 30)
        
        style( Text("\(Int(value))") )
            .contentTransition(.identity)   // 切り替え方法 即時
            .monospacedDigit()              // 桁の幅が揃える
    }
}



// MARK: - private
extension AnimationNumberView {

}



#Preview {
    AnimationNumberView()
}
