import Foundation


/// ex) `@DefaultUUID var id   : String`
@propertyWrapper
struct DefaultUUID: Codable {
    var wrappedValue: String

    init(wrappedValue: String = UUID().uuidString) { self.wrappedValue = wrappedValue }

    init(from decoder: Decoder) throws {
        wrappedValue = (try? decoder.singleValueContainer().decode(String.self)) ?? UUID().uuidString
    }

    func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
}

public extension KeyedDecodingContainer {
    func decode(_ type: DefaultUUID.Type, forKey key: Key) throws -> DefaultUUID {
        try decodeIfPresent(type, forKey: key) ?? DefaultUUID()
    }
}
