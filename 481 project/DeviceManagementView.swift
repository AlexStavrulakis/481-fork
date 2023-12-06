import SwiftUI

struct DeviceManagementView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedColor: CGColor = DeviceManager.shared.backgroundColor


    var body: some View {
        NavigationView {
            ZStack {
                Color(selectedColor)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Text("Device Management")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()

                    NavigationLink(destination: AddDeviceView(), label: {
                        Text("Add Device")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                    })

                    NavigationLink(destination: RemoveDeviceView(), label: {
                        Text("Remove Device")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                    })

                    NavigationLink(destination: ViewDevicesView(), label: {
                        Text("View Devices")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                    })

                    Spacer()

                    // Custom back button
                    Button("Back") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .navigationBarHidden(true)
                }
            }
            .navigationBarBackButtonHidden(true) // Hide the default back button
            .navigationBarTitle("", displayMode: .inline) // Clear the title to prevent the back button from appearing
            .navigationBarHidden(true)
        }
    }
}

struct DeviceManagementView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceManagementView()
    }
}
