import Foundation


/// ex) `@DefaultUUID var id   : String`
@propertyWrapper
public struct DefaultUUID: Codable {
    public var wrappedValue: String

    public init(wrappedValue: String = UUID().uuidString) { self.wrappedValue = wrappedValue }

    public init(from decoder: Decoder) throws {
        wrappedValue = (try? decoder.singleValueContainer().decode(String.self)) ?? UUID().uuidString
    }

    public func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
}

public extension KeyedDecodingContainer {
    public func decode(_ type: DefaultUUID.Type, forKey key: Key) throws -> DefaultUUID {
        try decodeIfPresent(type, forKey: key) ?? DefaultUUID()
    }
}
