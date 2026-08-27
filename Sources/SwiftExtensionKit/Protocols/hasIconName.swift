//  Created by Yuuichi Mizuno
import Foundation

public protocol hasIconName {
    var iconName: String { get }
}

public protocol HaveImageSystemName: Equatable {
    var iconName: String {get}
}
