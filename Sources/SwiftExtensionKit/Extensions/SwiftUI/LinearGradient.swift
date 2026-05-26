import SwiftUI

public extension LinearGradient {

    static var styleMonoTone: LinearGradient {
        LinearGradient(
            colors: [
                Color(hue: 0, saturation: 0, brightness: 0.6),
                Color(hue: 0, saturation: 0, brightness: 0.2),
                Color(hue: 0, saturation: 0, brightness: 0.4),
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    static var styleCyanTone: LinearGradient {
        LinearGradient(
            colors: [
                Color(hue: 0.6, saturation: 0.5, brightness: 0.7),
                Color(hue: 0.6, saturation: 0.5, brightness: 0.3),
                Color(hue: 0.6, saturation: 0.5, brightness: 0.5),
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

