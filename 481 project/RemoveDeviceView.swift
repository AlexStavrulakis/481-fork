import SwiftUI

struct RemoveDeviceView: View {
    @StateObject private var deviceManager = DeviceManager.shared
    @State private var selectedDevice: String = ""
    @State private var selectedColor: CGColor = DeviceManager.shared.backgroundColor

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
        .background(Color(selectedColor).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Remove Device", displayMode: .inline)
        .foregroundColor(.white)
    }
}

struct RemoveDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveDeviceView()
    }
}

