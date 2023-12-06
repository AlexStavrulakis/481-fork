import Foundation
import SwiftUI
// Device model
struct Device {
    var name: String
    var type: String
    var manufacturer: String
    var id: String
    var status: String
}

// User model
struct User {
    var username: String
    var password: String
}

// Data storage class for devices and users
class DeviceManager: ObservableObject {
    static var shared = DeviceManager()

    @Published var devices: [Device] = [
        Device(name: "Smart TV", type: "Entertainment", manufacturer: "Sony", id: "1", status: "On"),
        Device(name: "Smart Fridge", type: "Food", manufacturer: "Samsung", id: "2", status: "On"),
        Device(name: "Medicine Dispenser", type: "Medicine", manufacturer: "WVU", id: "3", status: "On")
        // Add more devices as needed
    ]

    @Published var users: [User] = [
        User(username: "User1", password: "password1"),
        User(username: "User2", password: "password2"),
        // Add more users as needed
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

    // User authentication
    func authenticateUser(username: String, password: String) -> Bool {
        return users.contains { $0.username == username && $0.password == password }
    }

    // Add a new user
    func addUser(_ newUser: User) {
        users.append(newUser)
    }
    
    @Published var backgroundColor: CGColor = UIColor.black.cgColor

}

