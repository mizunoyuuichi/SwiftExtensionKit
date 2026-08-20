//  Created by Mizuno Yuichi

import SwiftUI

extension AnyTransition {
    /// 指定した不透明度から 1.0 へ
    static func fade(from: Double) -> AnyTransition {
        .modifier(
            active: OpacityModifier(opacity: from),
            identity: OpacityModifier(opacity: 1)
        )
    }
}

struct OpacityModifier: ViewModifier {
    let opacity: Double
    func body(content: Content) -> some View {
        content.opacity(opacity)
    }
}
