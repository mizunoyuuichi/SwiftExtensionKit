import SwiftUI

public struct BottomDock<Content> : View where Content : View {

    public let innerView: Content

    @State private var isAppear = false
    private let kGestureHeight: CGFloat = 70
    private let kDockHeight   : CGFloat = 100
    private let kDockCornerRadius: CGFloat = 36
    private let kDockHiddenOffset: CGFloat = 240
    private let dockAnimation = Animation.interpolatingSpring(stiffness: 260, damping: 28)

    public init(@ViewBuilder content: () -> Content) {
        self.innerView = content()
    }

    public var body: some View {
        ZStack(alignment: .bottom) {
            if isAppear {
                Rectangle()
                    .fill(.ultraThinMaterial.opacity(0.9).blendMode(.multiply))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture { toggleDock() }

                VStack {
                    innerView
                    //
                }
                .frame(maxWidth: .infinity)
                .frame(height: kDockHeight)
                .dockGlassBackground(cornerRadius: kDockCornerRadius)
                .clipShape(RoundedRectangle(cornerRadius: kDockCornerRadius, style: .continuous))
                .shadow(color: .black.opacity(0.18), radius: 16, y: 4)
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                .contentShape(Rectangle())
                .onTapGesture { toggleDock() }
                .transition(
                    .asymmetric(
                        insertion: .offset(y: kDockHiddenOffset),
                        removal: .offset(y: kDockHiddenOffset)
                    )
                )
            }
            else {
                Color.clear
                    .frame(maxWidth: .infinity)
                    .frame(height: kGestureHeight)
                    .contentShape(Rectangle())
                    .onTapGesture { toggleDock() }
                    .ignoresSafeArea()
            }
        }
        .ignoresSafeArea()
        .animation(dockAnimation, value: isAppear)
    }

    public func toggleDock() {
        withAnimation(dockAnimation) {
            isAppear.toggle()
        }
    }
}



