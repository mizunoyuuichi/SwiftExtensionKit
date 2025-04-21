//  Created by Yuuichi Mizuno

import Foundation
import CoreFoundation
import CoreGraphics

public extension Int {
	// MARK: - cast
	var cgfloat: CGFloat {
		CGFloat(self)
	}

	var renge: Range<Int> {
		0..<self
	}

	var random: Int {
		.random(in: 0...self)
	}

	// MARK: - compar
	var plus1: Int {
		self + 1
	}
}
