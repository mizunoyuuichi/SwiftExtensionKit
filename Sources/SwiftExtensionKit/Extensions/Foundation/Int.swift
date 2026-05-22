//  Created by Yuuichi Mizuno

import Foundation
import CoreFoundation
import CoreGraphics



// MARK: - cast
public extension Int {

    var cgfloat: CGFloat { CGFloat(self) }

    var string : String  { String(self) }

    var range  : Range<Int> { 0..<self }


    var second : TimeInterval { TimeInterval(self) }

    var minutes: TimeInterval { TimeInterval(self * 60) }

    var hours  : TimeInterval { TimeInterval(self) * 60.minutes }

    var days   : TimeInterval { TimeInterval(self) * 24.hours }

    var month  : TimeInterval { TimeInterval(self) * 30.days }
}



// MARK: - debug
public extension Int {

    var random : Int { Int.random(in: 0...self) }
}




// MARK: - format
public extension Int {

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

    var jpYen: String { "¥\(separated)" }
}



// MARK: - compar
public extension Int {

    var isPositive: Bool { 0 < self }

    var isNegativeOrNeutral: Bool { self <= 0 }

    var isNeutral: Bool { self == 0 }

    var isNegative: Bool { self < 0 }

    var plus1: Int { self + 1 }

    func equalOrMoreThan(_ target: Int) -> Bool {
        return (target <= self)
    }

    func lessThan(_ target: Int) -> Bool {
        return self < target
    }
}
