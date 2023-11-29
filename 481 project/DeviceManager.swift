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
        Device(name: "Smart TV", type: "Entertainment", manufacturer: "Sony", id: "1", status: "On"),
        Device(name: "Smart Fridge", type: "Food", manufacturer: "Samsung", id: "2", status: "On"),
        Device(name: "Medicine Dispenser", type: "Medicine", manufacturer: "WVU", id: "3", status: "On")
        
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

