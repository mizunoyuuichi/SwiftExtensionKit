import Foundation

extension UserDefaults {

    static func save(_ key: String, value: Any) {
        standard.set(value, forKey: key)
        standard.synchronize()
    }

    static func remove(_ key: String) {
        standard.removeObject(forKey: key)
        standard.synchronize()
    }

    static func register(_ key: String, defaultValue: Any) {
        standard.register(defaults: [key : defaultValue])
        standard.synchronize()
    }

    static func load<T>(_ key: String, returnType: T.Type) -> T? {
        if let result = standard.value(forKey: key) as? T {
            return result
        }
        else {
            return nil  // for debug.
        }
    }

    static func clearAll() {
        _ = standard.dictionaryRepresentation().forEach({
            standard.removeObject(forKey: $0.key)
        })
        standard.synchronize()
    }

}
