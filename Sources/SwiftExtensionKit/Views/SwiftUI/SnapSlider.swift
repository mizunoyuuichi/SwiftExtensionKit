import SwiftUI

public struct SnapSlider: View {
    @Binding private var current : Double
    @State private var max     : Double
    @State private var step    : Double

    public var onChanged: ((Double) -> Void)?

    public init(current: Binding<Double>,
                max  : Double = 10,
                step : Double = 1) {
        self._current = current
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
    @Previewable @State var sampleDouble: Double = 0.5

    SnapSlider(current: $sampleDouble, max: 1, step: 0.1)
}
