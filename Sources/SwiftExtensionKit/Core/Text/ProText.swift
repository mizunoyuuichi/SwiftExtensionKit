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

    // MEMO: .scaleEffect は更新のサイクルの収束を乱さない(更新ループを起こさない)
    public var body: some View {
        EnvironmentReader(\.appAdjustment) { adjustment in
            switch self {
            case .head(let text, let style),
                 .subHead(let text, let style),
                 .label(let text, let style),
                 .body(let text, let style),
                 .caption(let text, let style),
                 .footnote(let text, let style):
                Text(text)
                    .font(.system(size: size, weight: weight))
                    .foregroundStyle(foregroundStyle)
                    .withTextStyle(style)
                    .scaleEffect((adjustment.textScale + 0.5), anchor: .topLeading)
            }
        }
    }

    var size: CGFloat {
        switch self {
        case .head(_, _)    : 18.0
        case .subHead(_, _) : 17.0
        case .label(_, _)   : 16.0
        case .body(_, _)    : 16.0
        case .caption(_, _) : 14.0
        case .footnote(_, _): 12.0
        }
    }

    var weight: Font.Weight {
        switch self {
        case .head(_, _)    : .bold
        case .subHead(_, _) : .semibold
        case .label(_, _)   : .medium
        case .body(_, _)    : .regular
        case .caption(_, _) : .light
        case .footnote(_, _): .light
        }
    }

    var foregroundStyle: Color {
        switch self {
        case .head(_, _)    : Color.k90
        case .subHead(_, _) : Color.k80
        case .label(_, _)   : Color.k80
        case .body(_, _)    : Color.k70
        case .caption(_, _) : Color.k50
        case .footnote(_, _): Color.k40
        }
    }
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
