//  Created by Yuuichi Mizuno

import Foundation
import CoreFoundation
import CoreGraphics

public extension Int {
	var cgfloat: CGFloat {
		CGFloat(self)
	}

	// MARK: - compar
	var plus1: Int {
		self + 1
	}
}
