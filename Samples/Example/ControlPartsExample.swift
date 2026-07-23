import SwiftUI
import SwiftExtensionKit

struct ControlPartsExample: View {
    var body: some View {
        VStack {
            SnapSlider()
            VolumeSnapSlider()
        }
    }
}



struct VolumeSnapSlider: View {
    @State private var volume: Double = 5
    @State private var step  : Double = 1

    init(volume: Double = 5,
         step  : Double = 1) {
        self.volume = volume
        self.step   = step
    }

    var body: some View {
        Slider(
            value: $volume,
            in: 0...10,
            step: step
        ) {
            Text("音量")
        } minimumValueLabel: {
            Image(systemName: "speaker.fill")
        } maximumValueLabel: {
            Image(systemName: "speaker.wave.3.fill")
        }
    }
}



// MARK: - static
extension ControlPartsExample {

    static func buildOnViewController() -> UIViewController {
        UIHostingController(rootView: ControlPartsExample())
    }
}



#Preview {
    ControlPartsExample()
}
