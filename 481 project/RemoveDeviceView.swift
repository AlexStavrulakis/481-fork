import SwiftUI

struct RemoveDeviceView: View {
    @StateObject private var deviceManager = DeviceManager.shared
    @State private var selectedDevice: String = ""

    var body: some View {
        VStack {
            Picker("Select a device to remove", selection: $selectedDevice) {
                ForEach(deviceManager.devices.map { $0.name }, id: \.self) { deviceName in
                    Text(deviceName)
                        .foregroundColor(.white)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .padding()

            Button("Remove Device") {
                if !selectedDevice.isEmpty {
                    deviceManager.removeDeviceByName(selectedDevice)
                    selectedDevice = ""  // Clear the selection after removal
                }
            }
            .foregroundColor(.white)
            .padding()

            Spacer()
        }
        .background(Color(red: 0, green: 0, blue: 50.0/255.0).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Remove Device", displayMode: .inline)
        .foregroundColor(.white)
    }
}

struct RemoveDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveDeviceView()
    }
}

