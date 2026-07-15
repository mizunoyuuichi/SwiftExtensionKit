import SwiftUI

public struct CenteredPopup<PopupContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    let dismissOnTapOutside: Bool
    @ViewBuilder let popupContent: () -> PopupContent

    private static var presentAnimation: Animation {
        .spring(response: 0.55, dampingFraction: 0.82)
    }

    private static var dismissAnimation: Animation {
        // 透明度先行の蒸発感が分かるよう、少し長めに
        .easeOut(duration: 0.32)
    }

    public func body(content: Content) -> some View {
        content.overlay {
            ZStack {
                if isPresented {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .transition(
                            .asymmetric(
                                insertion: .opacity,
                                removal: .opacity
                            )
                        )
                        .onTapGesture {
                            if dismissOnTapOutside { isPresented = false }
                        }

                    popupContent()
                        .transition(
                            .asymmetric(
                                insertion: .offset(y: 20)
                                    .combined(with: .scale(scale: 0.92))
                                    .combined(with: .opacity),
                                removal: .offset(y: -10)
                                    .combined(with: .scale(scale: 1.08))
                                    .combined(with: .opacity)
                            )
                        )
                }
            }
            .animation(
                isPresented ? Self.presentAnimation : Self.dismissAnimation,
                value: isPresented
            )
        }
    }
}


// MARK: - Evaporate transition

/// 進捗 `progress`（0=表示, 1=消去）に対し、透明度だけ先に完了させる。
private struct EvaporateModifier: ViewModifier, Animatable {
    var progress: CGFloat
    var offsetY: CGFloat
    var endScale: CGFloat
    /// 1より大きいほど透明度が早く完了（2 = 進捗50%で透明）
    var opacityLead: CGFloat

    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }

    func body(content: Content) -> some View {
        content
            .opacity(1 - min(progress * opacityLead, 1))
            .offset(y: offsetY * progress)
            .scaleEffect(1 + (endScale - 1) * progress)
    }
}

private extension AnyTransition {
    /// 透明度を先行させ、その後も offset / scale が続く蒸発風の removal。
    static func evaporate(
        offsetY: CGFloat = -20,
        scale: CGFloat = 1.1,
        opacityLead: CGFloat = 2
    ) -> AnyTransition {
        .modifier(
            active: EvaporateModifier(
                progress: 1,
                offsetY: offsetY,
                endScale: scale,
                opacityLead: opacityLead
            ),
            identity: EvaporateModifier(
                progress: 0,
                offsetY: offsetY,
                endScale: scale,
                opacityLead: opacityLead
            )
        )
    }
}


public extension View {

    func centeredPopup<PopupContent: View>(
        isPresented: Binding<Bool>,
        dismissOnTapOutside: Bool = true,
        @ViewBuilder content: @escaping () -> PopupContent
    ) -> some View {
        modifier(CenteredPopup(isPresented: isPresented,
                               dismissOnTapOutside: dismissOnTapOutside,
                               popupContent: content))
    }
}
