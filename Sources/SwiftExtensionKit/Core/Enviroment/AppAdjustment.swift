import SwiftUI

/***
 以下のように祖先のViewで注入して その際必要な値を上書きして 使ってください
 @main
 struct MyApp: App {
     @State private var appAdjustment = AppAdjustment() // 必要に応じて値調整する

     var body: some Scene {
         WindowGroup {
             ContentView()
                 .environment(\.appAdjustment, appAdjustment)
         }
     }
 }

 Viewに準拠していれば、どこからでもアクセス可能です。
 @Environment(\.appTheme) private var theme

 Text(text).foregroundColor(theme.primaryColor)
 ***/


@Observable
public class AppAdjustment  {
    public var textScale: Double = 0.5  // 0 ~ 1

    public init(textScale: Double = 0.5) {
        self.textScale = textScale
    }
}

public extension EnvironmentValues {
    @Entry public var appAdjustment: AppAdjustment = AppAdjustment()
}
