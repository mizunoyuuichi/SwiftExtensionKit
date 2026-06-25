//  Created by Yuuichi Mizuno.

import UIKit

// MARK: - hierarchy
public extension UIViewController {

    func addChildWithConstraintAroundOver(_ child: UIViewController) {
        view.addSubviewWithConstraintAround(child.view)
        child.didMove(toParent: self)
    }
}
