
//hello this is alex

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var showWelcomeView: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0, green: 0, blue: 50.0/255.0) // Dark navy blue
                    .edgesIgnoringSafeArea(.all)

                if isLoggedIn {
                    NavigationLink("", destination: WelcomeView(username: username, isLoggedIn: $isLoggedIn, showWelcomeView: $showWelcomeView), isActive: $showWelcomeView)
                        .hidden()
                } else {
                    VStack {
                        Text("Login")
                            .font(.largeTitle)
                            .foregroundColor(.white)

                        TextField("Username", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 0, green: 0, blue: 50.0/255.0)) // Navy blue text color
                            .padding()

                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 0, green: 0, blue: 50.0/255.0)) // Navy blue text color
                            .padding()

                        Button("Login") {
                            // Perform authentication here and set the 'isLoggedIn' state to true if successful
                            if performAuthentication() {
                                isLoggedIn = true
                                showWelcomeView = true // Activate the navigation link
                            }
                        }
                        .padding()
                    }
                }
            }
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

