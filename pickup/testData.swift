import Foundation

let sampleCurrentUser = User(
    name: "Marcus",
    city: "Los Angeles",
    state: .california,
    experienceLevel: .recreational,
    positions: [.pointGuard, .shootingGuard],
    gamePreferences: [.threeOnThree, .fiveOnFive],
    scoringPreferences: [.onesAndTwos]
)

let sampleFriends: [User] = [
    User(
        name: "Jordan",
        city: "Long Beach",
        state: .california,
        experienceLevel: .highSchool,
        positions: [.shootingGuard, .smallForward],
        gamePreferences: [.threeOnThree, .fiveOnFive],
        scoringPreferences: [.onesAndTwos]
    ),

    User(
        name: "Chris",
        city: "Anaheim",
        state: .california,
        experienceLevel: .recreational,
        positions: [.pointGuard],
        gamePreferences: [.oneOnOne, .threeOnThree],
        scoringPreferences: [.onesAndTwos, .twosAndThrees]
    ),

    User(
        name: "Andre",
        city: "Pasadena",
        state: .california,
        experienceLevel: .college,
        positions: [.powerForward, .center],
        gamePreferences: [.fiveOnFive],
        scoringPreferences: [.twosAndThrees]
    ),

    User(
        name: "Malik",
        city: "Inglewood",
        state: .california,
        experienceLevel: .recreational,
        positions: [.smallForward, .powerForward],
        gamePreferences: [.threeOnThree, .fiveOnFive],
        scoringPreferences: [.onesAndTwos]
    ),

    User(
        name: "Daniel",
        city: "Torrance",
        state: .california,
        experienceLevel: .highSchool,
        positions: [.pointGuard, .shootingGuard],
        gamePreferences: [.oneOnOne, .threeOnThree, .fiveOnFive],
        scoringPreferences: [.onesAndTwos]
    )
]
