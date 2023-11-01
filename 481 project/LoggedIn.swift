import SwiftUI

struct WelcomeView: View {
    var username: String
    @State private var isLoggingOut = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome, \(username)!")
                    .font(.title)
                    .padding()

                Text("Device Management")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .padding()

                NavigationLink(destination: Text("Manage Devices")) {
                    Text("Manage Devices")
                        .font(.headline)
                        .padding()
                }

                NavigationLink(destination: Text("Manage Account")) {
                    Text("Manage Account")
                        .font(.headline)
                        .padding()
                }

                NavigationLink(destination: Text("Settings")) {
                    Text("Settings")
                        .font(.headline)
                        .padding()
                }

                Button("Logout") {
                    isLoggingOut = true
                }
                .font(.headline)
                .foregroundColor(.red)
                .padding()
                .alert(isPresented: $isLoggingOut) {
                    Alert(
                        title: Text("Logout"),
                        message: Text("Are you sure you want to log out?"),
                        primaryButton: .default(Text("Yes")) {
                            // Perform logout action, e.g., reset user state
                            // You can navigate back to the login screen here
                        },
                        secondaryButton: .cancel()
                    )
                }

                Spacer()
            }
        }
        .navigationTitle("Welcome")
    }
}
