import Foundation

// MARK: - resize
extension CGSize {

    func smaller(_ range: CGFloat) -> CGSize {
        CGSize(width:  self.width  - range,
               height: self.height - range)
    }

    func smaller(rate: CGFloat) -> CGSize {
        CGSize(width:  self.width  * rate,
               height: self.height * rate)
    }

    func larger(_ range: CGFloat) -> CGSize {
        CGSize(width:  self.width  + range,
               height: self.height + range)
    }
}
