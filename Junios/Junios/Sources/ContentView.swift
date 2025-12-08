import SwiftUI

public struct ContentView: View {
    @AppStorage("user_login") private var isLoggedIn: Bool = false
    @AppStorage("user_name") private var userName: String = ""
    @State private var showLoginView: Bool = false

    public init() {}

    public var body: some View {
        VStack(spacing: 20) {
            if isLoggedIn {
                Text("안녕하세요 \(userName)")
                    .font(.title)

                Button("로그아웃") {
                    isLoggedIn = false
                    userName = ""
                }
                .buttonStyle(.bordered)
            } else {
                Button("로그인") {
                    showLoginView = true
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .fullScreenCover(isPresented: $showLoginView) {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
