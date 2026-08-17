import SwiftUI

extension Transition {

    func withoutAnimation<R>(_ body: () throws -> R) rethrows -> R {
        try withTransaction(\.disablesAnimations, true, body)
    }
}
