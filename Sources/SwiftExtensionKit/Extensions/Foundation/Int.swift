//  Created by Yuuichi Mizuno

import Foundation
import CoreFoundation
import CoreGraphics

public extension Int {

	// MARK: - debug
	var random: Int {
		Int.random(in: 0...self)
	}

	// MARK: - cast
	var cgfloat: CGFloat {
		CGFloat(self)
	}

	var string: String {
		String(self)
	}

	var range: Range<Int> {
		0..<self
	}

	// MARK: - compar
	var isPositive: Bool {
		0 < self
	}

	var isNegativeOrNeutral: Bool {
		self <= 0
	}

	var isNeutral: Bool {
		self == 0
	}

	var isNegative: Bool {
		self < 0
	}

	var plus1: Int {
		self + 1
	}

	// MARK: - format
	var separated: String {
		get {
			let isMinus = self < 0
			let formatter = NumberFormatter()
				formatter.numberStyle = .decimal
				formatter.groupingSeparator = ","
				formatter.groupingSize = 3
			let formated = formatter.string(from: NSNumber(value: abs(self))) ?? "0"
			return isMinus ? "-\(formated)" : "\(formated)"
		}
	}

	var jpYen: String {
		"¥\(separated)"
	}
}
