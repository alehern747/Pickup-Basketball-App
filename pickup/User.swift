import Foundation

// filler info
struct User {
    let id: UUID = UUID()
    
    var name: String = "Marcus"
    var city: String = "Los Angeles"
    var state: USState = .california
    var experienceLevel: ExperienceLevel = .recreational
    var positions: Set<Position> = [.pointGuard, .shootingGuard]
    var gamePreferences: Set<GameFormat> = [.oneOnOne, .fiveOnFive]
    var scoringPreferences: Set<ScoringFormat> = [.onesAndTwos]
    
    // var profileImageURL: URL?
    // some kind of user id?
}

enum GameFormat: String, CaseIterable {
    case oneOnOne = "1v1"
    case threeOnThree = "3v3"
    case fiveOnFive = "5v5"
}

enum ScoringFormat: String, CaseIterable {
    case onesAndTwos = "1s and 2s"
    case twosAndThrees = "2s and 3s"
    
    var pointValues: [Int] {
        switch self {
        case .onesAndTwos: return [1, 2]
        case .twosAndThrees: return [2, 3]
        }
    }
}

enum ExperienceLevel: String, CaseIterable {
    case none = "None"
    case recreational = "Recreational"
    case highSchool = "High School"
    case college = "College"
    case semiProfessional = "Semi-Professional"
    case professional = "Professional"
}

enum Position : String, CaseIterable {
    case pointGuard = "Point Guard"
    case shootingGuard = "Shooting Guard"
    case smallForward = "Small Forward"
    case powerForward = "Power Forward"
    case center = "Center"
}

enum USState: String, CaseIterable {
    case alabama = "AL"
    case alaska = "AK"
    case arizona = "AZ"
    case arkansas = "AR"
    case california = "CA"
    case colorado = "CO"
    case connecticut = "CT"
    case delaware = "DE"
    case florida = "FL"
    case georgia = "GA"
    case hawaii = "HI"
    case idaho = "ID"
    case illinois = "IL"
    case indiana = "IN"
    case iowa = "IA"
    case kansas = "KS"
    case kentucky = "KY"
    case louisiana = "LA"
    case maine = "ME"
    case maryland = "MD"
    case massachusetts = "MA"
    case michigan = "MI"
    case minnesota = "MN"
    case mississippi = "MS"
    case missouri = "MO"
    case montana = "MT"
    case nebraska = "NE"
    case nevada = "NV"
    case newHampshire = "NH"
    case newJersey = "NJ"
    case newMexico = "NM"
    case newYork = "NY"
    case northCarolina = "NC"
    case northDakota = "ND"
    case ohio = "OH"
    case oklahoma = "OK"
    case oregon = "OR"
    case pennsylvania = "PA"
    case rhodeIsland = "RI"
    case southCarolina = "SC"
    case southDakota = "SD"
    case tennessee = "TN"
    case texas = "TX"
    case utah = "UT"
    case vermont = "VT"
    case virginia = "VA"
    case washington = "WA"
    case westVirginia = "WV"
    case wisconsin = "WI"
    case wyoming = "WY"
}
