import SwiftUI

struct AddDeviceView: View {
    @State private var deviceName: String = ""
    @State private var deviceType: String = ""
    @State private var manufacturer: String = ""

    @StateObject private var deviceManager = DeviceManager.shared

    var body: some View {
        VStack {
            Text("Add Device")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()

            TextField("Device Name", text: $deviceName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.black)
                .padding()

            Picker("Device Type", selection: $deviceType) {
                Text("Entertainment").tag("Entertainment")
                Text("Food").tag("Food")
                Text("Medicine").tag("Medicine")
                Text("Camera").tag("Camera")
                // Add more types as needed
            }
            .pickerStyle(MenuPickerStyle())
            .foregroundColor(.white)
            .padding()

            TextField("Manufacturer", text: $manufacturer)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.black)
                .padding()

            Button("Add Device") {
                // Generate a random ID (for simplicity, you might want to use a more robust method)
                let randomID = UUID().uuidString

                // Create a new device
                let newDevice = Device(
                    name: deviceName,
                    type: deviceType,
                    manufacturer: manufacturer,
                    id: randomID,
                    status: "Off"
                )

                // Add the device to DeviceManager
                deviceManager.addDevice(newDevice)

                // Reset input fields
                deviceName = ""
                deviceType = ""
                manufacturer = ""
            }
            .foregroundColor(.white)
            .padding()

            Spacer()
        }
        .background(Color(red: 0, green: 0, blue: 50.0/255.0).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Add Device", displayMode: .inline)
        .foregroundColor(.white)
    }
}

struct AddDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeviceView()
    }
}

