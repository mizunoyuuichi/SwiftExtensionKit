import SwiftUI

/// 押下中は薄く、放すとアニメーション付きで元の濃さに戻るボタンスタイル。
/// デフォルトスタイルの「放した瞬間に濃く（黒く）見える」挙動を避ける。
public struct FadeButtonStyle: ButtonStyle {

    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.35 : 0.75)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
