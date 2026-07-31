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



public extension Array where Element: Hashable {

    /// 計算量 平均 O(n) ...入力に比例して増える線形
    var isUnique: Bool {
        Set(self).count == self.count
    }

    /// 計算量 平均 O(n) ...入力に比例して増える線形
    var duplicates: [Element] {
        var seen: Set<Element> = []
        var duplicated: Set<Element> = []

        for element in self {
            if !seen.insert(element).inserted {
                duplicated.insert(element)
            }
        }

        #if DEBUG
        if duplicated.count.isPositive {
            print("// elements has duplicates... \(duplicated)")
        }
        #endif

        return Array(duplicated)
    }
}
