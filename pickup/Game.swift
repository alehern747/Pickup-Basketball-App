import Foundation

// test data

let redTeam = Team(
    id: UUID(),
    name: "Red",
    wins: 2,
    losses: 0
)

let blueTeam = Team(
    id: UUID(),
    name: "Blue",
    wins: 1,
    losses: 1
)

let test_1 = TeamGameState(
    team: redTeam,
    score: 1,
    timeoutsRemaining: 2
)

let test_2 = TeamGameState(
    team: blueTeam,
    score: 0,
    timeoutsRemaining: 2
)

struct Game {
    var teamOne: TeamGameState = test_1
    var teamTwo: TeamGameState = test_2
    var scoringFormat: ScoringFormat = .onesAndTwos
    var gameFormat: GameFormat = .oneOnOne
    var targetScore: Int = 12
    var status: GameStatus = .preGame
    var winByTwo: Bool = true
    // var timer system?
    // status? ongoing, finished? maybe useful for checking a court is currently taken?
    // put location here too?
    
    var isOver: Bool { status == .concluded }
    
    var reachedTargetScore : Bool {
        let scoreDifference = abs(teamOne.score - teamTwo.score)
        let reachedTarget = teamOne.score >= targetScore || teamTwo.score >= targetScore
        
        if winByTwo {
            return reachedTarget && scoreDifference >= 2
        }

        return reachedTarget
    }
    
    func team(for side: GameSide) -> TeamGameState {
        switch side {
        case .teamOne:
            return teamOne
        case .teamTwo:
            return teamTwo
        }
    }
    
    mutating func addPoints(_ points: Int, to side: GameSide) {
        guard !isOver else { return }
        
        switch side {
        case .teamOne:
            teamOne.score += points
        
        case .teamTwo:
            teamTwo.score += points
        }
        
        if reachedTargetScore {
            status = .concluded
        }
    }
        
    enum GameStatus: String {
        case preGame = "Waiting to Start"
        case inProgress = "In Progress"
        case concluded = "Final"
        case intermission = "Break"
        // case firstQuarter = "Quarter 1"
        // case overtime = "OT"
    }
}

enum GameSide {
    case teamOne
    case teamTwo
}

struct Team {
    let id: UUID
    var name: String
    // var logo: URL?
    // var roster: [User] // more of a set? does that exist?
    var wins: Int
    var losses: Int
    // var league: String // change to actual league system?
}

struct TeamGameState {
    var team: Team
    var score: Int
    // var players: [User]
    var timeoutsRemaining: Int
}
