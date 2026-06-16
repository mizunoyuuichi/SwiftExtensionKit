import SwiftUI

// MARK: - level
public extension Text {
    /// 同じようなテキストの規格化 (純正のものは使いにくそうなので独自に用意)
    /// 基本5つ : { head, body, label, caption, footnote }

    /// 見出し
    func asHead() -> Text {
        self
            .font(.system(size: 18, weight: .medium))
            .fontWeight(.medium)
            .foregroundStyle(Color.k90)
    }
    /// UI部品
    func asLabel() -> Text {
        self
            .font(.system(size: 16, weight: .medium))
    }
    /// 本文
    func asBody() -> Text {
        self
            .font(.system(size: 16, weight: .regular))
            .foregroundStyle(Color.k70)
    }
    /// 補足
    func asCaption() -> Text {
        self
            .font(.system(size: 14, weight: .light))
            .foregroundColor(.k50)
    }
    /// 最小の注釈
    func asFootnote(isStraightLine: Bool = false, alignment: Alignment = .leading) -> Text {
        self
            .font(.system(size: 12, weight: .thin))
            .foregroundColor(.k40)
    }

    // MARK: 特殊系
    func asDetailLink(isActive: Bool = true, alignment: Alignment = .leading, isGuideGray: Bool = false) -> Text {
        self
            .font(.system(size: isGuideGray ? 14 : 10, weight: .medium))
            .foregroundColor(isGuideGray ? Color.k50 : .blue)
    }
}


// MARK: - style
public extension Text {

    /// 基本4つ { airily, relaxedly, formally, tightly }

    // 軽やかに
    func airily(alignment: TextAlignment = .leading) -> some View {
        self
            .kerning(4)
            .lineSpacing(2.5)
            //.frame(maxWidth: .infinity, alignment: alignment)
            //.frame(alignment: alignment)
            .multilineTextAlignment(alignment)
    }

    // ゆったりと
    func relaxedly(alignment: TextAlignment = .leading) -> some View {
        self
            .kerning(1.4)
            .lineSpacing(2)
            //.frame(maxWidth: .infinity, alignment: alignment)
            .multilineTextAlignment(alignment)
    }

    // きちんと
    func formally(alignment: TextAlignment = .leading) -> some View {
        self
            .kerning(-0.4)
            .lineSpacing(1.3)
            //.frame(maxWidth: .infinity, alignment: alignment)
            .multilineTextAlignment(alignment)
    }

    // しっかりだけど詰め気味
    func tightly(alignment: TextAlignment = .leading) -> some View {
        self
        .kerning(-0.2)
        .lineSpacing(1.1)
        //.frame(maxWidth: .infinity, alignment: alignment)
        .multilineTextAlignment(alignment)
//        .lineLimit(2)
        //.lineSpacing(2)
        //.minimumScaleFactor(0.5)
    }
}


// MARK: - style
public extension View {

    func nowrap(_ lineLimit: Int? = 1, minimumScaleFactor: CGFloat? = 0.8) -> some View {
        self
            .lineLimit(lineLimit).minimumScaleFactor(minimumScaleFactor ?? 1)
    }

    func leading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    func trailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
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



#Preview {
    let a: String = "日替わりセール 2026/06/15 このあのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。"

    VStack(alignment: .leading, spacing: 16) {
        Text(a + "　[asHead, airily]")
            .asHead().airily()

        Text(a + "　[asLabel, formally]")
            .asLabel().formally()

        Text(a + "　[asBody, relaxedly]")
            .asBody().relaxedly()

        Text(a + "　[asBody, formally]")
            .asBody().formally()

        Text(a + "　[asCaption, formally]")
            .asCaption().formally()


        Text(a + "　[asFootnote, tightly]")
            .asFootnote().tightly()

        Text("\(Image(systemName: "questionmark.circle")) シーズンのランクについて")
            .asDetailLink(isGuideGray: true).formally(alignment: .trailing)
    }
    .padding(.horizontal, 24)

}
