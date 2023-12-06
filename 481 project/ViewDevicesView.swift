import SwiftUI

struct ViewDevicesView: View {
    @StateObject private var deviceManager = DeviceManager.shared
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedColor: CGColor = DeviceManager.shared.backgroundColor


    var body: some View {
        ZStack {
            Color(selectedColor)
                .edgesIgnoringSafeArea(.all)

            VStack {
                List(deviceManager.devices, id: \.id) { device in
                    VStack(alignment: .leading) {
                        Text("Name: \(device.name)")
                            .foregroundColor(.black)
                        Text("Type: \(device.type)")
                            .foregroundColor(.black)
                        Text("Manufacturer: \(device.manufacturer)")
                            .foregroundColor(.black)
                        Text("ID: \(device.id)")
                            .foregroundColor(.black)
                        Text("Status: \(device.status)")
                            .foregroundColor(.black)
                    }
                    .padding()
                }
                .listStyle(PlainListStyle())

                Spacer()

                Button(action: {
                    // Handle back action
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Back")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                }
                .padding([.bottom, .horizontal])
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ViewDevicesView_Previews: PreviewProvider {
    static var previews: some View {
        ViewDevicesView()
    }
}

