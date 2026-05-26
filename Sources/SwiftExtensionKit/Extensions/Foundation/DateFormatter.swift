import Foundation

let kServerDateTimeFormat = String("yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ")
let kDateTimeOmitSecondsFormat = String("yyyy/MM/dd HH:mm")
let kDateFormat = String("yyyy-MM-dd")

public extension DateFormatter {

    func japaneaseDefaultTime() -> DateFormatter {
        timeZone = TimeZone(identifier: "Asia/Tokyo")
        locale = Locale(identifier: "ja_JP")
        calendar = Calendar(identifier: .gregorian)
        return self
    }

    func set(dateFormat: String) -> DateFormatter {
        self.dateFormat = dateFormat
        return self
    }

    func serverDateTimeFormat() -> DateFormatter {
        return set(dateFormat: kServerDateTimeFormat)
    }

    func dateTimeFormatOmitSeconds() -> DateFormatter {
        return set(dateFormat: kDateTimeOmitSecondsFormat)
    }

    func dateFormat() -> DateFormatter {
        return set(dateFormat: kDateFormat)
    }

}
