import SwiftUI

struct ControlPartsExample: View {
    var body: some View {
        VStack {
            SnapSlider()
            VolumeSnapSlider()
        }
    }


    struct SnapSlider: View {
        @State private var volume: Double = 5

        var body: some View {
            Slider(
                value: $volume,
                in: 0...10,
                step: 1
            )
        }
    }

    struct VolumeSnapSlider: View {
        @State private var volume: Double = 5

        var body: some View {
            Slider(
                value: $volume,
                in: 0...10,
                step: 1
            ) {
                Text("音量")
            } minimumValueLabel: {
                Image(systemName: "speaker.fill")
            } maximumValueLabel: {
                Image(systemName: "speaker.wave.3.fill")
            }
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
