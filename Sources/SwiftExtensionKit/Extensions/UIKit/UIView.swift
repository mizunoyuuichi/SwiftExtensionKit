//  Created by Yuuichi Mizuno

import UIKit

extension UIView { // MARK: - add / remove

	/// 上下左右 同じ状態で重ねる
	func addSubviewWithConstraintAround(_ subview: UIView, padding: CGFloat = 0) {
		subview.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(subview)
		NSLayoutConstraint.activate([
			subview.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
			subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding),
			subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: padding),
			subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: padding)
		])
	}
}
