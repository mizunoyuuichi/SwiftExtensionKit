//  Created by Yuuichi Mizuno

import Foundation
import SwiftUI

// MARK: - GeometryReader
extension View {

	@ViewBuilder
	func onChangeOffsetX(_ compHander: @escaping(CGFloat)->()) -> some View {
		overlay {
			GeometryReader { geometry in
				let offset = geometry.frame(in: .global).minX
				Color.clear
					.preference(key: OnChangeOffsetXKey.self, value: offset)
					.onPreferenceChange(OnChangeOffsetXKey.self, perform: compHander)
			}
		}
	}
}

// MARK: - PreferenceKeys
struct OnChangeOffsetXKey: PreferenceKey {
	static var defaultValue: CGFloat = 0
	static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
		value = nextValue()
	}
}
