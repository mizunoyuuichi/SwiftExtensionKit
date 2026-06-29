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



// MARK: - change
public extension Color {
    
    /// iOS17~
    func adjust(bright: CGFloat = 0,
                sturation: CGFloat,
                in environment: EnvironmentValues = EnvironmentValues()
    ) -> Color {
        guard #available(iOS 17.0, *) else { return self }
        
        let resolveColor = self.resolve(in: environment),
            r = CGFloat(resolveColor.red),
            g = CGFloat(resolveColor.green),
            b = CGFloat(resolveColor.blue),
            a = CGFloat(resolveColor.opacity)
        var (h, s, v) = Self.rgbToHSV(r: r, g: g, b: b)
        s = min(max(s + sturation, 0), 1)
        v = min(max(v + bright, 0), 1)
        
        return Color(hue: h, saturation: s, brightness: v, opacity: a)
    }
    
    static func rgbToHSV(r: CGFloat, g: CGFloat, b: CGFloat) -> (h: CGFloat, s: CGFloat, v: CGFloat) {
        let maxV = max(r, g, b),
            minV = min(r, g, b),
            deltaV = maxV - minV
        
        var h: CGFloat = 0,
            s: CGFloat = 0
        
        if deltaV != 0 {
            if maxV == r {
                let hue = (g - b) / deltaV
                h = hue.truncatingRemainder(dividingBy: 6)
            }
            else if maxV == g {
                h = (b - r) / deltaV + 2
            }
            else if maxV == b {
                h = (r - g) / deltaV + 4
            }
            h /= 6
            if h < 0 { h += 1 }
        }
        s = maxV == 0 ? 0 : deltaV / maxV

        return (h, s, maxV)
    }
}
