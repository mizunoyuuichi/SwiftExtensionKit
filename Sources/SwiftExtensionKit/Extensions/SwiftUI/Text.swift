import SwiftUI



// MARK: - style
public extension Text {

    func styleHead1() -> some View {
        font(.headline).fontWeight(.semibold).lineLimit(1)
    }

    func styleBody1() -> some View {
        font(.footnote).lineLimit(1)
    }
}
