//  Created by Mizuno Yuichi

import Foundation

// MARK: - cast
public extension CGPoint {

    var toSize: CGSize {
        CGSize(width:  self.x, height: self.y)
    }
}
