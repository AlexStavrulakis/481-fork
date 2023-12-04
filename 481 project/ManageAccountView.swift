import SwiftUI

struct ManageAccountView: View {
    @State private var showDeleteAlert = false
    @State private var isAccountDeleted = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0, green: 0, blue: 50.0/255.0)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Text("Manage Account")
                        
                        .foregroundColor(.white)
                        .padding()

                
                    // Edit accunt infoButton
                    NavigationLink(destination: EditAccountInfoView()) {
                                            Text("Edit Account Info")
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .padding()
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()


                    // Change Password Button
                    NavigationLink(destination: ChangePasswordView()) {
                                            Text("Change Password")
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .padding()
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()

                    Button("Delete Account") {
                        showDeleteAlert.toggle()
                    }
                    .font(.headline)
                    .foregroundColor(.red)
                    .padding()
                    .alert(isPresented: $showDeleteAlert) {
                        Alert(
                            title: Text("Delete Account"),
                            message: Text("Are you sure you want to delete your account? This action cannot be undone."),
                            primaryButton: .destructive(Text("Delete")) {
                                isAccountDeleted = true
                            },
                            secondaryButton: .cancel()
                        )
                    }

                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .background(
                NavigationLink(destination: ContentView(), isActive: $isAccountDeleted) { EmptyView() }
            )
        }
    }
}

struct ManageAccountView_Previews: PreviewProvider {
    static var previews: some View {
        ManageAccountView()
    }
}

