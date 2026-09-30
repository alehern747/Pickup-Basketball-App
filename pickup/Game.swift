import Foundation

struct Game: Identifiable {
    let id: UUID = UUID()
    var teamOne: TeamGameState
    var teamTwo: TeamGameState
    var scoringFormat: ScoringFormat
    var gameFormat: GameFormat
    var targetScore: Int = 12
    var status: GameStatus = .preGame
    var winByTwo: Bool = true
    // var timer system?
    // var location?
    
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

struct TeamGameState {
    var team: Team
    var score: Int = 0
    // var players: [User]
    var timeoutsRemaining: Int
    // win / loss data, when pulled to game, should not be most current, so add version here
}
