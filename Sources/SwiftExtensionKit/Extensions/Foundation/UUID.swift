import Foundation

public extension UUID {

    /// これをIDにするのは手軽だが、運用するならReadableIDGeneratorも検討されたい
    func dateHead() -> String {
        let uuidString = self.uuidString
        let now = Date()
        let formatter = DateFormatter()
            formatter.dateFormat = "yyyyMMddHHmmss"
        return formatter.string(from: now) + uuidString
    }
}
