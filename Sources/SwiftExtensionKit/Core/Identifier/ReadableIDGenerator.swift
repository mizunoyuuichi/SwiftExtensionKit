import Foundation

///
/// UInt128のユニークなIDを生成します
///
/// if #available(iOS 18.0, *) {
///     let id = ReadableIDGenerator.shared.next()
///     print(id)   // 例: 2025070815304512304271230000
/// }

// MARK: - インストールID（初回に一度だけランダムに決めて固定）
@available(iOS 18.0, *)
public enum InstallID {
    /// 6桁（0..<1_000_000）のランダム値。初回生成後は保存して固定。
    static let value: UInt128 = {
        let key = "install_id"
        let d = UserDefaults.standard
        if let s = d.string(forKey: key), let v = UInt128(s) {
            return v
        }
        let v = UInt128(UInt64.random(in: 0..<1_000_000))
        d.set(String(v), forKey: key)
        return v
    }()
}



// MARK: - 読みやすいユニークID生成器
@available(iOS 18.0, *)
final public class ReadableIDGenerator {

    public static let shared = ReadableIDGenerator()   // singleton

    private var lastStamp: UInt64 = 0           // 前回の YYYYMMDDHHMMSSmmm（17桁）
    private var   counter: UInt64 = 0
    private let      lock         = NSLock()

    private static let maxCounter: UInt64 = 10_000   // 4桁（0..<10000）

    /// 現在時刻を YYYYMMDDHHMMSSmmm（17桁）の数値で返す
    private func timestamp17() -> UInt64 {
        let now = Date()
        let cal = Calendar(identifier: .gregorian)
        let   c = cal.dateComponents(in: TimeZone(identifier: "UTC")!, from: now)
        let  ms = UInt64((now.timeIntervalSince1970 * 1000)
                    .truncatingRemainder(dividingBy: 1000))
        return UInt64(c.year!)   * 10_000_000_000_000   // 年    ×10^13
             + UInt64(c.month!)  * 100_000_000_000      // 月    ×10^11
             + UInt64(c.day!)    * 1_000_000_000        // 日    ×10^9
             + UInt64(c.hour!)   * 10_000_000           // 時    ×10^7
             + UInt64(c.minute!) * 100_000              // 分    ×10^5
             + UInt64(c.second!) * 1_000                // 秒    ×10^3
             + ms                                       // ミリ秒 ×10^0
    }

    /// [17桁 タイムスタンプ][6桁 InstallID][4桁 カウンタ] = 27桁
    public func next() -> UInt128 {
        lock.lock(); defer { lock.unlock() }

        var stamp = timestamp17()
        if stamp == lastStamp {
            counter += 1
            if counter >= Self.maxCounter {        // 同一ms内で4桁使い切ったら次のmsを待つ
                while stamp <= lastStamp {
                    stamp = timestamp17()
                }
                counter = 0
            }
        }
        else {
            counter = 0
        }
        lastStamp = stamp

        return UInt128(stamp) * 10_000_000_000       // タイムスタンプ ×10^10（下10桁を空ける）
             + InstallID.value * 10_000              // InstallID   ×10^4
             + UInt128(counter)                      // カウンタ      ×10^0
    }
}
