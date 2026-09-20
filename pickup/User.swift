import Foundation

// filler info
struct User {
    var name: String = "Marcus"
    var city: String = "Los Angeles"
    var state: String = "CA"
    var yearsExperience: Int = 1
    var experienceLevel: ExperienceLevel = .recreational
    var positions: [Position] = [.pointGuard, .shootingGuard]
    var gamePreferences: [GameFormat] = [.oneOnOne, .fiveOnFive]
    var scoringPreferences: [ScoringFormat] = [.onesAndTwos]
    
    // var profileImageURL: URL?
    // some kind of user id?
    // add date for started playing? age?
}

enum GameFormat: String {
    case oneOnOne = "1v1"
    case threeOnThree = "3v3"
    case fiveOnFive = "5v5"
}

enum ScoringFormat: String {
    case onesAndTwos = "1s and 2s"
    case twosAndThrees = "2s and 3s"
}

enum ExperienceLevel: String {
    case none = "No Organized Experience"
    case recreational = "Recreational"
    case highSchool = "High School"
    case college = "College"
    case semiProfessional = "Semi-Professional"
    case professional = "Professional"
}

enum Position : String {
    case pointGuard = "Point Guard"
    case shootingGuard = "Shooting Guard"
    case smallForward = "Small Forward"
    case powerForward = "Power Forward"
    case center = "Center"
}
