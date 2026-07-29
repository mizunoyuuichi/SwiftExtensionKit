import SwiftUI
import SwiftExtensionKit

struct ControlPartsExample: View {

    @State var sampleDouble: Double = 0.5
    @State private var selection = 0
    let options = ["A", "B", "C"]

    var body: some View {
        VStack {
            SnapSlider(current: $sampleDouble, max: 1, step: 0.2)
            VolumeSnapSlider()

            Form {
                Picker("segmented", selection: $selection) {
                    ForEach(0..<options.count, id: \.self) { Text(options[$0]) }
                }
                .pickerStyle(.segmented)

                Picker("menu", selection: $selection) {
                    ForEach(0..<options.count, id: \.self) { Text(options[$0]) }
                }
                .pickerStyle(.menu)

                Picker("wheel", selection: $selection) {
                    ForEach(0..<options.count, id: \.self) { Text(options[$0]) }
                }
                .pickerStyle(.wheel)

                Picker("inline", selection: $selection) {
                    ForEach(0..<options.count, id: \.self) { Text(options[$0]) }
                }
                .pickerStyle(.inline)

                Picker("navigationLink", selection: $selection) {
                    ForEach(0..<options.count, id: \.self) { Text(options[$0]) }
                }
                .pickerStyle(.navigationLink)
            }
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
