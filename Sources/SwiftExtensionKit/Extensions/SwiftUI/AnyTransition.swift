//  Created by Mizuno Yuichi

import SwiftUI

public extension AnyTransition {
    /// 指定した不透明度から 1.0 へ
    static func fade(from: Double) -> AnyTransition {
        .modifier(
            active: OpacityModifier(opacity: from),
            identity: OpacityModifier(opacity: 1)
        )
    }
}

public struct OpacityModifier: ViewModifier {
    let opacity: Double
    public func body(content: Content) -> some View {
        content.opacity(opacity)
    }
}
