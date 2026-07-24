//  Created by Yuuichi Mizuno

import Foundation
import SwiftUI


public struct OptionSwitch<T: CaseIterable & hasDescription & hasIconName & Hashable> : View {
    var current: T
    var selected: ((T)->Void)?

    public var body: some View {
        Menu {
            ForEach(Array(T.allCases), id: \.self) { item in
                Button {
                    selected?(item)
                } label: {
                    Text(item.description)
                    if item == current {
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
¥
