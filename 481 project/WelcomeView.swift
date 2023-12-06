import SwiftUI

struct WelcomeView: View {
    var username: String
    @Binding var isLoggedIn: Bool
    @State private var selectedColor: CGColor = DeviceManager.shared.backgroundColor
    @EnvironmentObject var loggedInUser: LoggedInUser


    var body: some View {
        ZStack {
            Color(selectedColor)
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

