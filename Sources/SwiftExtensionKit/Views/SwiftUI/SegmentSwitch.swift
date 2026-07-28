//  Created by Mizuno Yuichi

import SwiftUI

public struct SegmentSwitch<T: CaseIterable & hasDescription & hasIconName & Hashable>: View {

    @Binding private var current : T
    // NOTE: アイコンとタイトルの混在が推奨されておらず テキストのみになる
    @State private var style : TitleAndIconLabelStyle = .titleAndIcon

    public var onChanged : ((T)->())?

    public init(current   : Binding<T>,
                style     : TitleAndIconLabelStyle? = nil,
                onChanged : ((T)->Void)? = nil) {
        self._current  = current
        self.onChanged = onChanged
        if let style {
            self.style = style
        }
    }

    public var body: some View {
        Picker(
            "segmented",
            selection: Binding(
                get: { current },
                set: { newValue in
                    if onChanged != nil {
                        onChanged?(newValue)
                    }
                    else {
                        current = newValue
                    }
                    //withAnimation(.smooth(duration: 0.25, extraBounce: 0.0)) {
                    //
                    //}
                }
            )
        ) {
            ForEach(Array(T.allCases), id: \.self) { e in
                Label(e.description, systemImage: e.iconName)
                    .labelStyle(style)
                    .tag(e)
            }
        }
        .pickerStyle(.segmented)
    }
}

// MARK: - プレビュー用のサンプル enum
public enum SampleTab: CaseIterable, hasDescription, hasIconName, Hashable {
    case list
    case grid
    case map

    public var description: String {
        switch self {
        case .list: return "リスト"
        case .grid: return "グリッド"
        case .map:  return "マップ"
        }
    }

    public var iconName: String {
        switch self {
        case .list: return "list.bullet"
        case .grid: return "square.grid.2x2"
        case .map:  return "map"
        }
    }
}

#Preview {
    @Previewable @State var selected: SampleTab = .list

    SegmentSwitch(current: $selected) { newValue in
        print("選択変更: \(newValue)")
    }
    .padding()
}
