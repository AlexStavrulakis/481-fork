import SwiftUI
// User class to hold logged-in user's information
class LoggedInUser: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
   

    
    func setUser(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var logInError: String = ""
    @State private var isLoggedIn: Bool = false
    @StateObject private var loggedInUser = LoggedInUser()
    @State private var selectedColor: CGColor = DeviceManager.shared.backgroundColor

    @StateObject private var deviceManager = DeviceManager.shared
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(selectedColor)
                    .edgesIgnoringSafeArea(.all)
                
                if isLoggedIn {
                    WelcomeView(username: username, isLoggedIn: $isLoggedIn)
                        .environmentObject(deviceManager)
                    
                } else {
                    VStack {
                        Text("Welcome!")
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
                        
                        Text(logInError)
                                        .foregroundColor(.red)
                                        .padding()

                        
                        Button("Login") {
                            // Perform authentication here and set the 'isLoggedIn' state to true if successful
                            if performAuthentication() {
                                isLoggedIn = true
                            }
                        }
                        .padding()
                        .foregroundColor(.white)
                        
                        NavigationLink(destination: SignUpView().environmentObject(deviceManager)) {
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
    
    // Function to perform authentication
    func performAuthentication() -> Bool {
        let users = deviceManager.users
        
        // Check if the entered username and password match any in the user list
        if let userIndex = users.firstIndex(where: { $0.username == username && $0.password == password }) {
            loggedInUser.setUser(username: username, password: password)

            print("Login Successful as \(users[userIndex].username)")
            return true
        } else {
            print("Login Failed")
            logInError = "Login Failed"
            return false
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
         

    }
}

