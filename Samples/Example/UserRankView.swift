import SwiftUI

struct UserRankView: View {
    var body: some View {
        Text("Hello, World!!!")
    }
}


// MARK: - static
extension UserRankView {

    static func buildOnViewController() -> UIViewController {
        UIHostingController(rootView: UserRankView())
    }
}


// MARK: - public
extension UserRankView {

}


// MARK: - private
extension UserRankView {

}



#Preview {
    UserRankView()
}
