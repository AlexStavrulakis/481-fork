// ManageAccountView.swift
import SwiftUI

struct ManageAccountView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color(red: 0, green: 0, blue: 50.0/255.0)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Manage Account")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()

                // Add your account management content here

                Spacer()

                // Custom back button
                Button("Back") {
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct ManageAccountView_Previews: PreviewProvider {
    static var previews: some View {
        ManageAccountView()
    }
}

