//  Created by Yuuichi Mizuno.

import UIKit

public extension UIViewController {

    func addChildWithConstraintAroundOver(_ child: UIViewController) {
        view.addSubviewWithConstraintAround(child.view)
        child.didMove(toParent: self)
    }
}
