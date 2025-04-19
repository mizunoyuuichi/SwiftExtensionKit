//
//  SwiftExtensionKit
//  Created by Yuuichi Mizuno
//

import SwiftUI

extension Color {

	static func random() -> Color {
		return Color(
			red: .random(in: 0...0.5),
			green: .random(in: 0...0.5),
			blue: .random(in: 0...1)
		).opacity(0.5)
	}
}


extension Color {

	static var monoTone0  : Color { Color.init(hue: 0, saturation: 0, brightness: 0) }
	static var monoTone10 : Color { Color.init(hue: 0, saturation: 0, brightness: 0.1) }
	static var monoTone20 : Color { Color.init(hue: 0, saturation: 0, brightness: 0.2) }
	static var monoTone30 : Color { Color.init(hue: 0, saturation: 0, brightness: 0.3) }
	static var monoTone40 : Color { Color.init(hue: 0, saturation: 0, brightness: 0.4) }
	static var monoTone50 : Color { Color.init(hue: 0, saturation: 0, brightness: 0.5) }
	static var monoTone60 : Color { Color.init(hue: 0, saturation: 0, brightness: 0.6) }
	static var monoTone70 : Color { Color.init(hue: 0, saturation: 0, brightness: 0.7) }
	static var monoTone80 : Color { Color.init(hue: 0, saturation: 0, brightness: 0.8) }
	static var monoTone90 : Color { Color.init(hue: 0, saturation: 0, brightness: 0.9) }
	static var monoTone100: Color { Color.init(hue: 0, saturation: 0, brightness: 1.0) }
}
