//  Created by Yuuichi Mizuno

import Foundation
import SwiftUI


public struct OptionSwitch<T: CaseIterable & hasDescription & hasIconName & Hashable> : View {
    @Binding private var current : T

    public var onChanged : ((T)->())?

    public init(current   : Binding<T>,
                onChanged : ((T)->Void)? = nil) {
        self._current  = current
        self.onChanged = onChanged
    }

    public var body: some View {
        Menu {
            ForEach(Array(T.allCases), id: \.self) { e in
                Button {
                    onChanged?(e)
                } label: {
                    Text(e.description)
                    if e == current {
                        Image(systemName: "checkmark")
                    }
                }
            }
        } label: {
            HStack(spacing: 4) {
                Image(systemName: current.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.k70)
                    .frame(width: 12, height: 12)
                Text(current.description)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(Color.k50)
            }
            .frame(height: 32)
            .padding(.horizontal, 8)
            .background(.white)
            .cornerRadius(4)
            .overlay {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.k40, lineWidth: 1)
            }
        }
        .shadow(color: .black.opacity(0.15),
                radius: 1, x: 0, y: 1)
    }
}


private enum OptionSwitchPreviewMode: CaseIterable, hasDescription, hasIconName {
    case all
    case favorites
    case recent

    var description: String {
        switch self {
        case .all:
            "All"
        case .favorites:
            "Favorites"
        case .recent:
            "Recent"
        }
    }

    var iconName: String {
        switch self {
        case .all:
            "square.grid.2x2"
        case .favorites:
            "star"
        case .recent:
            "clock"
        }
    }
}



private struct OptionSwitchPreview: View {
    @State private var current: OptionSwitchPreviewMode = .all

    var body: some View {
        VStack(spacing: 16) {
            OptionSwitch(current: $current) { selected in
                current = selected
            }

            Text(current.description)
                .font(.caption)
                .foregroundStyle(Color.k50)
        }
        .padding(24)
        .background(Color.k4)
    }
}



#Preview {
    OptionSwitchPreview()
}

