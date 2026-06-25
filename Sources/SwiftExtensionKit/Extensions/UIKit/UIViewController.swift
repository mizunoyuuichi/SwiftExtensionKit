//  Created by Yuuichi Mizuno.

import UIKit

// MARK: - hierarchy
public extension UIViewController {

    func addChildWithConstraintAroundOver(_ child: UIViewController) {
        view.addSubviewWithConstraintAround(child.view)
        child.didMove(toParent: self)
    }
    
    /// モーダルdismiss時の 連続タップ防止策
    var isStillDisplayingInModal: Bool {
        view.window != nil && presentingViewController != nil && isBeingDismissed == false
    }

}
