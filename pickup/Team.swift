import Foundation

struct Team {
    let id: UUID = UUID()
    var name: String
    // var logo: URL?
    var city: String
    var state: USState
    var roster: [User]
    var wins: Int = 0
    var losses: Int = 0
}
