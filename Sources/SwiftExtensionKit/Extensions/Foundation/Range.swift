//  Created by Yuuichi Mizuno

import Foundation
import CoreFoundation
import CoreGraphics

public extension Range where Element: Equatable & Comparable {

	// MARK: - cast
	var array: [Bound] {
		Array(self)
	}
}
