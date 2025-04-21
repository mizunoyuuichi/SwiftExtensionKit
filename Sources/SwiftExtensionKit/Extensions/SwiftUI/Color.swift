//
//  SwiftExtensionKit
//  Created by Yuuichi Mizuno
//

import SwiftUI

extension Color {

	public static func random() -> Color {
		return Color(
			red: .random(in: 0...0.5),
			green: .random(in: 0...0.5),
			blue: .random(in: 0...1)
		).opacity(0.5)
	}
}


extension Color {

	public static var k100 : Color { Color.init(hue: 0, saturation: 0, brightness: 0) }
	public static var k90  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.1) }
	public static var k80  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.2) }
	public static var k70  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.3) }
	public static var k60  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.4) }
	public static var k50  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.5) }
	public static var k40  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.6) }
	public static var k30  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.7) }
	public static var k20  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.8) }
	public static var k10  : Color { Color.init(hue: 0, saturation: 0, brightness: 0.9) }
	public static var k0   : Color { Color.init(hue: 0, saturation: 0, brightness: 1.0) }
}
