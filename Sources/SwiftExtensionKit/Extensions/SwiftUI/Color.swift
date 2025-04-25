//
//  SwiftExtensionKit
//  Created by Yuuichi Mizuno
//

import SwiftUI

public extension Color {

	static func random() -> Color {
		return Color(
			red: .random(in: 0...0.5),
			green: .random(in: 0...0.5),
			blue: .random(in: 0...1)
		).opacity(0.5)
	}
}


public extension Color {

	static var k100 : Color { Color.init(hue: 0, saturation: 0, brightness: 0) }
	static var k90  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.1) }
	static var k80  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.2) }
	static var k70  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.3) }
	static var k60  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.4) }
	static var k50  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.5) }
	static var k40  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.6) }
	static var k30  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.7) }
	static var k20  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.8) }
	static var k10  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.9) }
	static var k4   : Color { Color.init(hue: 0, saturation: 0, brightness: 0.96) }
	static var k0   : Color { Color.init(hue: 0, saturation: 0, brightness: 1.0) }
}
