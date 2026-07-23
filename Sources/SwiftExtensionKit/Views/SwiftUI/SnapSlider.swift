import SwiftUI

public struct SnapSlider: View {
    @State private var value : Double
    @State private var max   : Double
    @State private var step  : Double

    public var onChanged: ((Double) -> Void)?

    public init(value: Double = 5,
         max  : Double = 10,
         step : Double = 1) {
        self.value = value
        self.max   = max
        self.step  = step
    }

    public var body: some View {
        Slider(
            value: $value,
            in: 0...max,
            step: step
        )
        .onChange(of: value) { old, new in
            onChanged?(new)
        }
    }
}

#Preview {
    SnapSlider()
}
