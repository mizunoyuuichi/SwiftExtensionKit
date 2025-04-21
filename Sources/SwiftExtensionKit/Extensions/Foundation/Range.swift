//  Created by Yuuichi Mizuno

import Foundation
import CoreFoundation
import CoreGraphics

public extension Range {

	// MARK: - cast
	var array: [Bound] {
		Swift.Array(self)
	}
}
