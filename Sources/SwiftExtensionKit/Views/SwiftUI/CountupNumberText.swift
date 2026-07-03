import SwiftUI

// MEMO: Textを失わざるおえない難点があり、ある程度HStackなどで回避してもらう制約がある
//       ( Text ではなく Viewになってしまうため )
public struct CountupNumberText: View, Animatable {

    public var value: Double
    public var style: (Text) -> Text = { $0 }

    public init(value: Double, style: @escaping (Text) -> Text = { $0 }) {
        self.value = value
        self.style = style
    }

    public var animatableData: Double { // NOTE: Animatableプロトコルの要件としてこの名称である必要
        get { value }
        set { value = newValue }
    }

    public var body: some View {
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

//#Preview {
//    SwiftUIView()
//}

