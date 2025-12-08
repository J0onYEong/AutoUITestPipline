import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("user_login") private var isLoggedIn: Bool = false
    @AppStorage("user_name") private var userName: String = ""

    @State private var inputName: String = ""

    private var isValidName: Bool {
        !inputName.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("로그인 하기")
                .font(.largeTitle)
                .fontWeight(.bold)

            TextField("이름을 입력하세요", text: $inputName)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Button("로그인") {
                userName = inputName.trimmingCharacters(in: .whitespaces)
                isLoggedIn = true
                dismiss()
            }
            .disabled(!isValidName)
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
