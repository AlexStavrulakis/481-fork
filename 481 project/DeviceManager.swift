import Foundation

// Device model
struct Device {
    var name: String
    var type: String
    var manufacturer: String
    var id: String
    var status: String
}

// Data storage class
class DeviceManager: ObservableObject {
    static var shared = DeviceManager()

    @Published var devices: [Device] = [
        Device(name: "Smart TV", type: "Entertainment", manufacturer: "ABC Corp", id: "12345", status: "On"),
        Device(name: "Smart Refrigerator", type: "Food", manufacturer: "XYZ Inc", id: "67890", status: "Off"),
        // Add more devices as needed
    ]

    // Get all devices
    func getAllDevices() -> [Device] {
        return devices
    }

    // Add a new device
    func addDevice(_ newDevice: Device) {
        devices.append(newDevice)
    }

    // Remove a device by name
    func removeDeviceByName(_ name: String) {
        devices.removeAll { $0.name == name }
    }
}

