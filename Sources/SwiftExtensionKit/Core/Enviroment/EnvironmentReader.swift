import SwiftUI

public struct EnvironmentReader<Value, Content: View>: View {
    @Environment private var value: Value

    private let content: (Value) -> Content

    public init(_ keyPath: KeyPath<EnvironmentValues, Value>,
         @ViewBuilder content: @escaping (Value) -> Content) {
        self._value = Environment(keyPath)
        self.content = content
    }

    public var body: some View {
        content(value)
    }
}
