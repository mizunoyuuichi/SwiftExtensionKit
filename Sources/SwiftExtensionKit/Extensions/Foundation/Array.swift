//  Created by Yuuichi Mizuno

import Foundation

public extension Array {

	var anyObject: AnyObject {
		self as AnyObject
	}

	var isPresent: Bool {
		0 < self.count
	}

	var isSingle: Bool {
		self.count == 1
	}

	var isEmpty: Bool {
		self.count <= 0
	}

	func isInRange(_ index: Int) -> Bool {
		index < self.count
	}

	func withinRange(_ row: Int) -> Element? {
		guard 0 <= row else { return nil }
		return isInRange(row) ? self[row] : nil
	}

	func head(_ row: Int) -> Array {
		Array(prefix(row))
	}

	func tail(_ row: Int) -> Array {
		suffix(row)
	}
}
