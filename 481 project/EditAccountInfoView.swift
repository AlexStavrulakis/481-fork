import SwiftUI

struct EditAccountInfoView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var username = ""
    @State private var email = ""
    @State private var isEditingFirstName = false
    @State private var isEditingLastName = false
    @State private var isEditingUsername = false
    @State private var isEditingEmail = false
    @State private var selectedColor: CGColor = DeviceManager.shared.backgroundColor


    var body: some View {
        ZStack {
            Color(selectedColor)
                .edgesIgnoringSafeArea(.all)
            
            

            VStack {
                Text("Edit Account Info")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()


                Button(action: { isEditingUsername.toggle() }) {
                    Text("Username \(username)")
                        .foregroundColor(.white)
                }
                .sheet(isPresented: $isEditingUsername) {
                    EditInfoView(info: $username)
                }

                Button(action: { isEditingEmail.toggle() }) {
                    Text("Email \(email)")
                        .foregroundColor(.white)
                }
                .sheet(isPresented: $isEditingEmail) {
                    EditInfoView(info: $email)
                }

                Spacer()
            }
            .padding()
            .navigationBarTitle("Edit Account Info", displayMode: .inline)
        }
    }
}

struct EditInfoView: View {
    @Binding var info: String

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter new value", text: $info)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Spacer()
            }
            .navigationBarTitle("Edit", displayMode: .inline)
            .navigationBarItems(trailing: Button("Done") {
                // Save the updated info and dismiss the view
                // (e.g., update the value in the parent view)
                // You may also perform validation or other necessary logic here
                // For simplicity, I'm just dismissing the view here
                UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
            })
        }
    }
}

struct EditAccountInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EditAccountInfoView()
    }
}
