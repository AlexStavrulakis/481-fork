import SwiftUI

struct WelcomeView: View {
    var username: String
    @Binding var isLoggedIn: Bool
    @Binding var showWelcomeView: Bool
    @State private var isLoggingOut = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0, green: 0, blue: 50.0/255.0) // Dark navy blue background
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    NavigationLink(destination: Text("Manage Devices")
                        .font(.title)
                        .foregroundColor(.white)) {
                        Text("Manage Devices")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                    }

                    NavigationLink(destination: Text("Manage Account")
                        .font(.title)
                        .foregroundColor(.white)) {
                        Text("Manage Account")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                    }

                    NavigationLink(destination: Text("Settings")
                        .font(.title)
                        .foregroundColor(.white)) {
                        Text("Settings")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                    }

                    Spacer()

                    Text("Logged in as \(username)")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .padding()

                    Button("Logout") {
                        isLoggingOut = true
                    }
                    .font(.headline)
                    .foregroundColor(.red)
                    .padding()

                }
            }
            .navigationTitle("")
        }
    }
}

