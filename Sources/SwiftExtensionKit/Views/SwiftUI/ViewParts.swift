//  Created by Yuuichi Mizuno

import Foundation
import SwiftUI

// MARK: - Parts
public extension View {

	@ViewBuilder
	func filterMenu<T: RawRepresentable & CaseIterable & Descriptable>(
		_ enumType: T.Type,
		_ current: T,
		_ selected: ((T)->())?
	) -> some View where T.RawValue == String, T: Hashable {
		Menu {
			ForEach(Array(enumType.allCases), id: \.self) { item in
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
				Image(systemName: "line.3.horizontal.decrease.circle")
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

