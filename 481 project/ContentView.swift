import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0, green: 0, blue: 50.0/255.0)
                    .edgesIgnoringSafeArea(.all)

                if isLoggedIn {
                    WelcomeView(username: username, isLoggedIn: $isLoggedIn)

                } else {
                    VStack {
                        Text("Login")
                            .font(.largeTitle)
                            .foregroundColor(.white)

                        TextField("Username", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 0, green: 0, blue: 50.0/255.0))
                            .padding()

                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 0, green: 0, blue: 50.0/255.0))
                            .padding()

                        Button("Login") {
                            // Perform authentication here and set the 'isLoggedIn' state to true if successful
                            if performAuthentication() {
                                isLoggedIn = true
                            }
                        }
                        .padding()
                        .foregroundColor(.white)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }

    func performAuthentication() -> Bool {
        // You would typically implement your authentication logic here
        // For this example, we'll just check if the username and password are not empty
        return !username.isEmpty && !password.isEmpty
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

