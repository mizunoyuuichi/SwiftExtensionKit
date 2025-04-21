//  Created by Yuuichi Mizuno

import Foundation
import CoreFoundation
import CoreGraphics

public extension String {

	// MARK: - format
	func sandwich(_ front: String, _ back: String) -> String {
		front + self + back
	}
}
