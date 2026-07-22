//  Created by Yuuichi Mizuno.

import UIKit
import SwiftExtensionKit

final class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}



// MARK: - static
extension RootViewController {

    static func build() -> RootViewController {
        RootViewController()
    }
}



// MARK: - private
extension RootViewController {

    private func initialize() {
        // 本当はリストから選べるようにしていく　今は一旦
        //view.addSubviewWithConstraintAround(CountupNumberView.buildOnViewController().view)
        //view.addSubviewWithConstraintAround(InputSheetExample.buildOnViewController().view)
        //view.addSubviewWithConstraintAround(CenteredPopupExample.buildOnViewController().view)
        view.addSubviewWithConstraintAround(ControlPartsExample.buildOnViewController().view)
    }
}
