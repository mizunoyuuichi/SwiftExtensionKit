import SwiftUI

// MARK: - style
public extension Text {
    /// 同じようなテキストの規格化 (純正のものは使いにくそうなので独自に用意)
    /// 基本5つ : { head, body, label, caption, footnote }
    ///            見出し, 本文, UI部品, 補足, 最小の注釈

    // MARK: 基本形
    func asHead(isActive: Bool = true, isSelected: Bool = false) -> some View {
        self
            .kerning(-0.2)
            .font(.system(size: 16))  // ここも上書きできる値参照させるか、、
            .fontWeight(isSelected ? .medium : .regular)
            .minimumScaleFactor(0.5)
            .lineLimit(2)
            .foregroundColor(isActive ? .k20 : .k50)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    func asCaption(isStraightLine: Bool = false) -> some View {
        self
            .font(.system(size: 11, weight: .medium))
            .minimumScaleFactor(0.5)
            .lineLimit(isStraightLine ? 1 : nil)
            .lineSpacing(2)
            .foregroundColor(.k40)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: 特殊系
    func asDetailLink(isActive: Bool = true) -> some View {
        self
            .font(.system(size: 10, weight: .medium))
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .foregroundColor(isActive ? .blue : .blue.opacity(0.6))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 4)
    }
}



// MARK: - style (廃止予定)
public extension Text {

    @available(*, deprecated, message: "新しいスタイル体系へ移行してください")
    func styleHead1() -> some View {
        font(.headline).fontWeight(.semibold).lineLimit(1)
    }

    @available(*, deprecated, message: "新しいスタイル体系へ移行してください")
    func styleBody1() -> some View {
        font(.footnote).lineLimit(1)
    }

}
