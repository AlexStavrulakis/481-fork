import SwiftUI

struct ChangePasswordView: View {
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var confirmNewPassword = ""
    @State private var showAlert = false
    @State private var successMessage = ""

    var passwordsMatch: Bool {
        return newPassword == confirmNewPassword
    }

    var body: some View {
        ZStack {
            Color(red: 0, green: 0, blue: 50.0/255.0)
                .edgesIgnoringSafeArea(.all)

            VStack {
                SecureField("Current Password", text: $currentPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.black) // Set the color of secure field text to black
                    .padding()

                SecureField("New Password", text: $newPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.black) // Set the color of secure field text to black
                    .padding()

                SecureField("Confirm New Password", text: $confirmNewPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.black) // Set the color of secure field text to black
                    .padding()

                Button("Update") {
                    if passwordsMatch {
                        successMessage = "Password updated successfully."
                        showAlert = false // Hide any previous mismatch alert
                    } else {
                        showAlert = true
                        successMessage = ""
                    }
                }
                .padding()

                if showAlert {
                    Text("New password doesn't match the confirmation.")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    Text(successMessage)
                        .foregroundColor(.green)
                        .padding()
                }
            }
            .padding()
            .navigationBarTitle("Change Password", displayMode: .inline).foregroundColor(.white)
        }
        .foregroundColor(.white)
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}

