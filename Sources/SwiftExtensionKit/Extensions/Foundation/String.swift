//  Created by Yuuichi Mizuno

import Foundation
import CoreFoundation
import CoreGraphics

// MARK: - cast
public extension String {

    var intValue: Int{ Int(self) ?? 0 }

    var toI: Int { self.intValue }
}



public extension String {

	// MARK: - format
	func sandwich(_ front: String, _ back: String) -> String {
		front + self + back
	}
}
