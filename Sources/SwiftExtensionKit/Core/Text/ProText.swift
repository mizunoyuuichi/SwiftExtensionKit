//  Created by Mizuno Yuichi

import SwiftUI

/// 文書レベル ごとに
public enum ProText: View {
    case head    (_ text: String, _ style: TextStyle)
    case subHead (_ text: String, _ style: TextStyle)
    case label   (_ text: String, _ style: TextStyle)
    case body    (_ text: String, _ style: TextStyle)
    case caption (_ text: String, _ style: TextStyle)
    case footnote(_ text: String, _ style: TextStyle)

    // MEMO: .scaleEffect は更新のサイクルの収束を乱さない(更新ループを起こさない)
    public var body: some View {
        EnvironmentReader(\.appAdjustment) { adjustment in
            Text.with(self)
                .scaleEffect((adjustment.textScale + 0.5), anchor: .topLeading)
        }
    }

    var size: CGFloat {
        switch self {
        case .head    : 18.0
        case .subHead : 17.0
        case .label   : 16.0
        case .body    : 16.0
        case .caption : 14.0
        case .footnote: 12.0
        }
    }

    var weight: Font.Weight {
        switch self {
        case .head    : .bold
        case .subHead : .semibold
        case .label   : .medium
        case .body    : .regular
        case .caption : .light
        case .footnote: .light
        }
    }

    var foregroundStyle: Color {
        switch self {
        case .head    : .adapt(light: Color.k90, dark: Color.k10)
        case .subHead : .adapt(light: Color.k80, dark: Color.k20)
        case .label   : .adapt(light: Color.k80, dark: Color.k20)
        case .body    : .adapt(light: Color.k70, dark: Color.k30)
        case .caption : .adapt(light: Color.k50, dark: Color.k50)
        case .footnote: .adapt(light: Color.k40, dark: Color.k60)
        }
    }
}

/// 文章Style を指定する
public struct TextStyle: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    // combination { kerning, lineSpacing }
    public static let airily      = TextStyle(rawValue: 1 << 0)
    public static let relaxedly   = TextStyle(rawValue: 1 << 1)
    public static let formally    = TextStyle(rawValue: 1 << 2)
    public static let tightly     = TextStyle(rawValue: 1 << 3)

    // individual
    public static let nowrap      = TextStyle(rawValue: 1 << 4)
    public static let leading     = TextStyle(rawValue: 1 << 5)
    public static let trailing    = TextStyle(rawValue: 1 << 6)

    public static let fixedWidth  = TextStyle(rawValue: 1 << 7)
    public static let fixedHeight = TextStyle(rawValue: 1 << 8)

    // TODO: fontfamily (上書き訂正用)追加

    var lineLimit: Int? {
        contains(.nowrap) ? 1 : nil
    }

    var alignment: Alignment {
        contains(.trailing) ? Alignment.trailing : Alignment.leading
    }

    var isFixedWidth: Bool {
        contains(.fixedWidth)
    }

    var isFixedHeight: Bool {
        contains(.fixedHeight)
    }

    var kerning: CGFloat {
        if      contains(.airily)   {  4.0 }
        else if contains(.relaxedly){  1.4 }
        else if contains(.formally) { -0.4 }
        else if contains(.tightly)  { -0.2 }
        else                        {  0   }
    }

    var lineSpacing: CGFloat {
        if      contains(.airily)   {  2.5 }
        else if contains(.relaxedly){  2.0 }
        else if contains(.formally) {  1.3 }
        else if contains(.tightly)  {  1.1 }
        else                        {  0   }
    }
}



// MARK: - TextStyle
public extension Text {

    // ProText用なので これだけ Extensionsディレクトリではなくこちらに記載
    static func with(_ type: ProText) -> some View {

        switch type {
        case .head     (let text, let style),
             .subHead  (let text, let style),
             .label    (let text, let style),
             .body     (let text, let style),
             .caption  (let text, let style),
             .footnote (let text, let style):
            Text(text)
                .font(.system(size: type.size, weight: type.weight))
                .kerning(style.kerning)
                .foregroundStyle(type.foregroundStyle)
                .fixedSize(horizontal: style.isFixedWidth, vertical: style.isFixedHeight)
                .lineSpacing(style.lineSpacing)
                .lineLimit(style.lineLimit)
                .frame(maxWidth: .infinity, alignment: style.alignment)
        }
    }
}


#Preview {
    let sampleString: String = "日替わりセール 2026/06/15 あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。"
    VStack(spacing: 4) {
        // 文章レベル +> テキスト +> スタイル という順に書いていく
        ProText.head(sampleString,     [.formally, .leading])
        ProText.subHead(sampleString,  [.formally, .leading])
        ProText.label(sampleString,    [.formally, .leading])
        ProText.body(sampleString,     [.formally, .leading])
        ProText.caption(sampleString,  [.formally, .leading])
        ProText.footnote(sampleString, [.formally, .leading])

        // テキストのレベル 以外のスタイルは 複数組み合わせで ','区切りで指定可能
        ProText.head(sampleString, [.formally, .trailing, .nowrap])

//        ProText.head(sampleString).withTextStyle(.airily)
//        ProText.head(sampleString).withTextStyle(.relaxedly)
//        ProText.head(sampleString).withTextStyle(.formally)
//        ProText.head(sampleString).withTextStyle()

//        ProText.subHead(.airily, sampleString)
//        ProText.subHead(.relaxedly, sampleString)
//        ProText.subHead(.formally, sampleString)
//        ProText.subHead(.tightly, sampleString)
//
//        ProText.label(.airily, sampleString)
//        ProText.label(.relaxedly, sampleString)
//        ProText.label(.formally, sampleString)
//        ProText.label(.tightly, sampleString)
//
//        ProText.body(.airily, sampleString)
//        ProText.body(.relaxedly, sampleString)
//        ProText.body(.formally, sampleString)
//        ProText.body(.tightly, sampleString)
//
//        ProText.caption(.airily, sampleString)
//        ProText.caption(.relaxedly, sampleString)
//        ProText.caption(.formally, sampleString)
//        ProText.caption(.tightly, sampleString)
//
//        ProText.footnote(.airily, sampleString)
//        ProText.footnote(.relaxedly, sampleString)
//        ProText.footnote(.formally, sampleString)
//        ProText.footnote(.tightly, sampleString)
    }
}
