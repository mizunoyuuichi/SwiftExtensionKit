import Foundation

public extension UUID {

    func dateHead() -> String {
        let uuidString = self.uuidString
        let now = Date()
        let formatter = DateFormatter()
            formatter.dateFormat = "yyyyMMddHHmmss"
        return formatter.string(from: now) + uuidString
    }
}
