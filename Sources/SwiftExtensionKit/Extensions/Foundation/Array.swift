//  Created by Yuuichi Mizuno

import Foundation

extension Array {

	func isInRange(_ index: Int) -> Bool {
		index < self.count
	}

	func withinRange(_ row: Int) -> Element? {
		guard 0 <= row else { return nil }
		return isInRange(row) ? self[row] : nil
	}
}
