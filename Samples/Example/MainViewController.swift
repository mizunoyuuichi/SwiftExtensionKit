//  Created by Yuuichi Mizuno.

import UIKit
import SwiftExtensionKit

final class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}



// MARK: - private
extension MainViewController {

    private func initialize() {
        addChildWithConstraintAroundOver(RootViewController.build())
    }
}
