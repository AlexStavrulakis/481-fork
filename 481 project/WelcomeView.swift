import SwiftUI

struct WelcomeView: View {
    var username: String
    @Binding var isLoggedIn: Bool

    var body: some View {
        ZStack {
            Color(red: 0, green: 0, blue: 50.0/255.0)
                .edgesIgnoringSafeArea(.all)

            VStack {
                NavigationLink(destination: DeviceManagementView()) {
                    Text("Manage Devices")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                }

                NavigationLink(destination: ManageAccountView()) {
                    Text("Manage Account")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                }

                NavigationLink(destination: SettingsView()) {
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
                    // Log out the current user
                    isLoggedIn = false
                }
                .font(.headline)
                .foregroundColor(.red)
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

