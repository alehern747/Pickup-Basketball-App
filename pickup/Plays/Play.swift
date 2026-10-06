import Foundation

struct Play: Identifiable {
    let id: String
    let name: String
    let altNames: [String]
    let tags: [PlayTag]
    let description: String
    let diagrams: [PlayDiagram]
}

struct PlayDiagram: Identifiable {
    let id: Int
    let imageName: String
    let playerInstructions: [PlayRole: String]
}

enum PlayRole: Int, CaseIterable, Codable {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
}

// eventually: add playbook unique to each user, allowing to save favorites? + search through

enum PlayTag: String {
    case ballScreen = "Ball Screen"
    case offBallScreen = "Off Ball"
    case pickAndRoll = "Pick and Roll"
    case defensive = "Defense"
    case horns = "Horns"
    case blob = "BLOB"
    case slob = "SLOB"
    case handoff = "DHO"
    case backdoor = "Backdoor"
    case threePointer = "3 Point"
    case fourOut = "4-Out"
    case fiveOut = "5-Out"
    case princeton = "Princeton"
    case twoThreeZone = "2-3 Zone"
    case postPlay = "Post"
    case zone = "Zone"
    // flex, stagger, backdoor cut, flare, add more custom
}

struct Drill {
    var name: String
    var tags: [PlayTag]
    var numPlayers: Int
    var instructions: String
}
