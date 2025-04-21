//  Created by Yuuichi Mizuno

import Foundation
import CoreFoundation
import CoreGraphics

public extension Int {
	var cgfloat: CGFloat {
		CGFloat(self)
	}

	var random: Int {
		.random(in: 0...self)
	}

	// MARK: - compar
	var plus1: Int {
		self + 1
	}
}
