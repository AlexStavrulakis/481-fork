import SwiftUI

struct SettingsView: View {
    @ObservedObject var deviceManager = DeviceManager.shared
    @State private var isColorConfirmed = false
    @State private var selectedColor: CGColor = DeviceManager.shared.backgroundColor

    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.title)
                .foregroundColor(.white)
                .padding()
            
            // Dropdown to select background color
            Picker(selection: $selectedColor, label: Text("Change Background Color")) {
                Text("Black").tag(UIColor.black.cgColor)
                Text("Blue").tag(UIColor.blue.cgColor)
                Text("Yellow").tag(UIColor.yellow.cgColor)
                Text("Grey").tag(UIColor.darkGray.cgColor)

                // Add more colors as needed
            }
            .pickerStyle(SegmentedPickerStyle())
            .foregroundColor(.white)
            .padding()
            
            // Confirm button to apply the selected color
            Button("Confirm") {
                deviceManager.backgroundColor = selectedColor
                isColorConfirmed = true
            }
            .foregroundColor(.white)
            .padding()
            
            Spacer()
            
            // Show confirmation message if color is confirmed
            if isColorConfirmed {
                Text("Color updated successfully!")
                    .foregroundColor(.green)
                    .padding()
            }
        }
        .background(Color(selectedColor).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Settings", displayMode: .inline)
        .navigationBarHidden(false)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

