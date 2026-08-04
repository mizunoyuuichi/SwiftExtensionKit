import SwiftUI

struct EnvironmentReader<Value, Content: View>: View {
    @Environment private var value: Value

    private let content: (Value) -> Content

    init(_ keyPath: KeyPath<EnvironmentValues, Value>,
         @ViewBuilder content: @escaping (Value) -> Content) {
        self._value = Environment(keyPath)
        self.content = content
    }

    var body: some View {
        content(value)
    }
}
