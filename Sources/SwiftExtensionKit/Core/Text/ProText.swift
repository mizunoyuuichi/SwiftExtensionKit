//  Created by Mizuno Yuichi

import SwiftUI

/// (...いい名前が思いつかないから一旦の名称とする)
public enum ProText: View {
    case head    (_ text: String, _ style: TextStyle)
    case subHead (_ text: String, _ style: TextStyle)
    case label   (_ text: String, _ style: TextStyle)
    case body    (_ text: String, _ style: TextStyle)
    case caption (_ text: String, _ style: TextStyle)
    case footnote(_ text: String, _ style: TextStyle)

    public var body: some View {
        EnvironmentReader(\.appAdjustment) { adjustment in
            switch self {
            case .head(let text, let style):
                let size = (18.0 * (adjustment.textScale + 0.5) * 1.4).rounded().cgfloat
                Text(text)
                    .font(.system(size: size, weight: .bold))
                    .foregroundStyle(Color.k90)
                    .withTextStyle(style)
            case .subHead(let text, let style):
                let size = (17.0 * (adjustment.textScale + 0.5) * 1.4).rounded().cgfloat
                Text(text)
                    .font(.system(size: size, weight: .semibold))
                    .foregroundStyle(Color.k80)
                    .withTextStyle(style)
            case .label(let text, let style):
                let size = (16.0 * (adjustment.textScale + 0.5) * 1.4).rounded().cgfloat
                Text(text)
                    .font(.system(size: size, weight: .medium))
                    .foregroundStyle(Color.k80)
                    .withTextStyle(style)
            case .body(let text, let style):
                let size = (16.0 * (adjustment.textScale + 0.5) * 1.4).rounded().cgfloat
                Text(text)
                    .font(.system(size: size, weight: .regular))
                    .foregroundStyle(Color.k70)
                    .withTextStyle(style)
            case .caption(let text, let style):
                let size = (14.0 * (adjustment.textScale + 0.5) * 1.4).rounded().cgfloat
                Text(text)
                    .font(.system(size: size, weight: .light))
                    .foregroundStyle(Color.k50)
                    .withTextStyle(style)
            case .footnote(let text, let style):
                let size = (12.0 * (adjustment.textScale + 0.5) * 1.4).rounded().cgfloat
                Text(text)
                    .font(.system(size: size, weight: .light))
                    .foregroundStyle(Color.k50)
                    .withTextStyle(style)
            }
        }
    }

//    public static func head(style: TextStyle = .formally, _ text: String) -> some View {
//        ProText.head(style, text).body
//    }
//    public static func subHead(style: TextStyle = .formally, _ text: String) -> some View {
//        ProText.subHead(style, text)
//    }
//    public static func label(style: TextStyle = .formally, _ text: String) -> some View {
//        ProText.label(style, text)
//    }
//    public static func body(style: TextStyle = .formally, _ text: String) -> some View {
//        ProText.body(style, text)
//    }
//    public static func caption(style: TextStyle = .formally, _ text: String) -> some View {
//        ProText.caption(style, text)
//    }
//    public static func footnote(style: TextStyle = .formally, _ text: String) ->  some View {
//        ProText.footnote(style, text)
//    }
}



#Preview {
    let sampleText: String = "日替わりセール 2026/06/15 あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。"
    VStack(spacing: 4) {
        ProText.head(sampleText, .airily)
        ProText.head(sampleText, .relaxedly)
        ProText.head(sampleText, .formally)
        ProText.head(sampleText, .tightly)

//        ProText.head(sampleText).withTextStyle(.airily)
//        ProText.head(sampleText).withTextStyle(.relaxedly)
//        ProText.head(sampleText).withTextStyle(.formally)
//        ProText.head(sampleText).withTextStyle()

//        ProText.subHead(.airily, sampleText)
//        ProText.subHead(.relaxedly, sampleText)
//        ProText.subHead(.formally, sampleText)
//        ProText.subHead(.tightly, sampleText)
//
//        ProText.label(.airily, sampleText)
//        ProText.label(.relaxedly, sampleText)
//        ProText.label(.formally, sampleText)
//        ProText.label(.tightly, sampleText)
//
//        ProText.body(.airily, sampleText)
//        ProText.body(.relaxedly, sampleText)
//        ProText.body(.formally, sampleText)
//        ProText.body(.tightly, sampleText)
//
//        ProText.caption(.airily, sampleText)
//        ProText.caption(.relaxedly, sampleText)
//        ProText.caption(.formally, sampleText)
//        ProText.caption(.tightly, sampleText)
//
//        ProText.footnote(.airily, sampleText)
//        ProText.footnote(.relaxedly, sampleText)
//        ProText.footnote(.formally, sampleText)
//        ProText.footnote(.tightly, sampleText)
    }
}
