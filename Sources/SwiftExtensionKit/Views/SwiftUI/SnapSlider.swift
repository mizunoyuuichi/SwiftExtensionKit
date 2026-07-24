import SwiftUI

public struct SnapSlider: View {
    @State private var current : Double
    @State private var max     : Double
    @State private var step    : Double

    public var onChanged: ((Double) -> Void)?

    public init(current: Double = 5,
                max  : Double = 10,
                step : Double = 1) {
        self.current = current
        self.max     = max
        self.step    = step
    }

    public var body: some View {
        Slider(
            value: $current,
            in: 0...max,
            step: step
        )
        .onChange(of: current) { old, new in
            onChanged?(new)
        }
    }
}

#Preview {
    SnapSlider()
}
