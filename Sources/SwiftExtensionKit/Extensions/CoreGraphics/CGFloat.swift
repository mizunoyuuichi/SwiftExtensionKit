import Foundation

extension CGFloat {

    static var one : CGFloat { CGFloat(1.0) }

    static var zero: CGFloat { CGFloat(0) }

    var roundedDown: CGFloat { CGFloat(floor(self)) }

    var roundedUp  : CGFloat { CGFloat(ceil(self)) }
}
