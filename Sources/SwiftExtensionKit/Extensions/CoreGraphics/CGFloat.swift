//  Created by Mizuno Yuichi

import Foundation

public extension CGFloat {

    static var one : CGFloat { CGFloat(1.0) }

    static var zero: CGFloat { CGFloat(0.0) }


    var double: CGFloat { self * 2 }

    var roundedDown: CGFloat { CGFloat(floor(self)) }

    var roundedUp  : CGFloat { CGFloat(ceil(self)) }


    func minus(_ subject: CGFloat) -> CGFloat {
        self - subject
    }

    func limit(min subject: CGFloat) -> CGFloat {
        (self >= subject)
            ? subject
            : self
    }

    func limit(max subject: CGFloat) -> CGFloat {
        (self <= subject)
            ? self
            : subject
    }
}
