//  Created by Yuuichi Mizuno

import Foundation
import SwiftUI

// MARK: - transfrom
public extension View {

    func shearY(_ angle: Angle = .degrees(30)) -> some View {
        self.transformEffect(CGAffineTransform(a: 1, b: tan(angle.radians), c: 0, d: 1, tx: 0, ty: 0))
    }
}



#Preview {
    RoundedRectangle(cornerRadius: 16)
        .fill(.thickMaterial)
        .frame(width: 100, height: 100)
        .shearY()
}
