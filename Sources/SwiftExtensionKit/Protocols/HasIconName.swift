//  Created by Yuuichi Mizuno
import Foundation

public protocol HasIconName {
    var iconName: String { get }
}

public protocol HasImageSystemName: Equatable {
    var iconName: String {get}
}
