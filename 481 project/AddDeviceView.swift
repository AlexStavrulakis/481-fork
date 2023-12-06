import SwiftUI

struct AddDeviceView: View {
    @State private var deviceName: String = ""
    @State private var deviceType: String = ""
    @State private var manufacturer: String = ""

    @State private var lastDeviceID = 3 // Initial ID set to 3 as per your request

    @StateObject private var deviceManager = DeviceManager.shared
    @State private var selectedColor: CGColor = DeviceManager.shared.backgroundColor


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
                Text("Security").tag("Security")
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
                lastDeviceID += 1 // Increment the device ID

                // Create a new device with an incremented ID
                let newDevice = Device(
                    name: deviceName,
                    type: deviceType,
                    manufacturer: manufacturer,
                    id: "\(lastDeviceID)",
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
        .background(Color(selectedColor).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Add Device", displayMode: .inline)
        .foregroundColor(.white)
    }
}

struct AddDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeviceView()
    }
}

