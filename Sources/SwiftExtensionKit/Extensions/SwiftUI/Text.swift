import SwiftUI

// MARK: - level
public extension Text {
    /// 同じようなテキストの規格化 (純正のものは使いにくそうなので独自に用意)
    /// 基本5つ : { head, body, label, caption, footnote }

    /// 見出し
    func asHead(isActive: Bool = true, isSelected: Bool = false) -> Text {
        self
            .kerning(-0.2)
            .font(.system(size: 18))  // ここも上書きできる値参照させるか、、
            .fontWeight(isSelected ? .medium : .regular)
            //.lineLimit(2)
            //.minimumScaleFactor(0.5)
            .foregroundStyle(isActive ? Color.k20 : Color.k50)
    }
    /// 本文
    func asBody(isStraightLine: Bool = false, alignment: Alignment = .leading) -> Text {
        self
            .font(.system(size: 16, weight: .medium))
            .foregroundStyle(Color.k40)
            //.minimumScaleFactor(0.5)
            //.lineLimit(isStraightLine ? 1 : nil)
            //.lineSpacing(2) as! Text

            //.frame(maxWidth: .infinity, alignment: alignment)
    }
    /// UI部品
    func asLabel() -> Text {
        self
    }
    /// 補足
    func asCaption(isStraightLine: Bool = false, alignment: Alignment = .leading) -> some View {
        self
            .font(.system(size: 14, weight: .medium))
            .minimumScaleFactor(0.5)
            .lineLimit(isStraightLine ? 1 : nil)
            .lineSpacing(2)
            .foregroundColor(.k40)
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    /// 最小の注釈
    func asFootnote(isStraightLine: Bool = false, alignment: Alignment = .leading) -> some View {
        self
            .font(.system(size: 12, weight: .medium))
            .minimumScaleFactor(0.5)
            .lineLimit(isStraightLine ? 1 : nil)
            .lineSpacing(2)
            .foregroundColor(.k40)
            .frame(maxWidth: .infinity, alignment: alignment)
    }

    // MARK: 特殊系
    func asDetailLink(isActive: Bool = true, alignment: Alignment = .leading) -> some View {
        self
            .font(.system(size: 10, weight: .medium))
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .foregroundColor(isActive ? .blue : .blue.opacity(0.6))
            .frame(maxWidth: .infinity, alignment: alignment)
            .padding(.top, 4)
    }
}


// MARK: - style
public extension Text {

    /// 基本4つ { airily, relaxedly, formally, tightly }

    // 軽やかに
    func airily() -> some View {
        self
    }

    // ゆったりと
    func relaxedly() -> some View {
        self
    }

    // きちんと
    func formally() -> some View {
        self
    }

    // しっかりだけど詰め気味
    func tightly() -> some View {
        self
        .kerning(-0.2)
        //.lineLimit(2)
        //.lineSpacing(2)
        //.minimumScaleFactor(0.5)
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
