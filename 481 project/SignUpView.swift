import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isSignUpSuccess: Bool = false
    @State private var signUpError: String = ""

    @State private var selectedColor: CGColor = DeviceManager.shared.backgroundColor


    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()

            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.black)
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.black)
                .padding()

            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.black)
                .padding()
            
            Text(signUpError)
                            .foregroundColor(.red)
                            .padding()

            Button("Sign Up") {
                signUp()
            }
            .foregroundColor(.white)
            .padding()

            if isSignUpSuccess {
                Text("Account created successfully!")
                    .foregroundColor(.green)
                    .padding()
            }
            
            Spacer()
        }
        .background(Color(selectedColor).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Sign Up", displayMode: .inline)
        .foregroundColor(.white)
    }

    func signUp() {
        guard !username.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
                signUpError = "Please fill in all fields."
                isSignUpSuccess = false
                return
            }
        // Check if passwords match
        guard password == confirmPassword else {
            // Show an error or alert indicating passwords don't match
            signUpError = "Passwords do not match."
            isSignUpSuccess = false
            return
        }

        // Check if the username already exists
        guard !DeviceManager.shared.users.contains(where: { $0.username == username }) else {
            // Show an error or alert indicating username already exists
            signUpError = "Username already exists."
            isSignUpSuccess = false
            return
        }

        // Add a new user to DeviceManager
        let newUser = User(username: username, password: password)
        DeviceManager.shared.addUser(newUser)

        // Set sign up success to true
        signUpError = ""
        isSignUpSuccess = true
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

