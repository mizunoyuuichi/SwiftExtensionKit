import SwiftUI
import UIKit

/// UILongPressGestureRecognizer を SwiftUI で使うためのラッパ。
///
/// SwiftUI の DragGesture は ScrollView との共存が難しい一方、
/// UILongPressGestureRecognizer は
/// - minimumPressDuration まで待機 → 動いたら自然に失敗 → ScrollView がスクロール
/// - 長押し成立 → 以降は指追従の .changed イベントを連続発火
/// という性質を持ち、ScrollView 内のセルでの「長押し → ドラッグ」用途に適している。
extension View {

    public func longPressToDragGesture(
        minimumPressDuration: TimeInterval = 0.25,
        onBegan: @escaping (CGPoint) -> Void,
        onChanged: @escaping (CGPoint) -> Void,
        onEnded: @escaping () -> Void
    ) -> some View {
        // overlay で UIView を前面に配置することで、ジェスチャ認識器に
        // 直接 touch が届くようにする。SwiftUI のフォアグラウンドが
        // touch を握り込まないようにするため。
        overlay(
            _LongPressDragRecognizerView(
                minimumPressDuration: minimumPressDuration,
                onBegan: onBegan,
                onChanged: onChanged,
                onEnded: onEnded
            )
        )
    }
}

private struct _LongPressDragRecognizerView: UIViewRepresentable {
    let minimumPressDuration: TimeInterval
    let onBegan: (CGPoint) -> Void
    let onChanged: (CGPoint) -> Void
    let onEnded: () -> Void

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear

        let recognizer = UILongPressGestureRecognizer(
            target: context.coordinator,
            action: #selector(Coordinator.handle(_:))
        )
        recognizer.minimumPressDuration = minimumPressDuration
        recognizer.delegate = context.coordinator
        view.addGestureRecognizer(recognizer)

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        context.coordinator.onBegan = onBegan
        context.coordinator.onChanged = onChanged
        context.coordinator.onEnded = onEnded
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(onBegan: onBegan, onChanged: onChanged, onEnded: onEnded)
    }

    final class Coordinator: NSObject, UIGestureRecognizerDelegate {
        var onBegan: (CGPoint) -> Void
        var onChanged: (CGPoint) -> Void
        var onEnded: () -> Void

        init(
            onBegan: @escaping (CGPoint) -> Void,
            onChanged: @escaping (CGPoint) -> Void,
            onEnded: @escaping () -> Void
        ) {
            self.onBegan = onBegan
            self.onChanged = onChanged
            self.onEnded = onEnded
        }

        @objc func handle(_ recognizer: UILongPressGestureRecognizer) {
            // nil = window coordinate space ≒ SwiftUI の .global と一致
            let location = recognizer.location(in: nil)

            switch recognizer.state {
                case .began:   onBegan(location)
                case .changed: onChanged(location)
                case .ended, .cancelled, .failed: onEnded()
                default: break
            }
        }

        // ScrollView の pan 等と共存できるようにする
        func gestureRecognizer(
            _ gestureRecognizer: UIGestureRecognizer,
            shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
        ) -> Bool {
            true
        }
    }
}
