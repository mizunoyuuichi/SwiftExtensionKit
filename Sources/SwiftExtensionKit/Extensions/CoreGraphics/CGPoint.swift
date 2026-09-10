//  Created by Mizuno Yuichi

import Foundation

// MARK: - cast
public extension CGPoint {

    var size: CGSize {
        CGSize(width:  self.x, height: self.y)
    }
}
