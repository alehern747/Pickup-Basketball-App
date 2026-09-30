import Foundation

// Logged in user

let sampleCurrentUser = User(
    name: "Marcus",
    city: "Los Angeles",
    state: .california,
    experienceLevel: .recreational,
    positions: [.pointGuard, .shootingGuard],
    gamePreferences: [.threeOnThree, .fiveOnFive],
    scoringPreferences: [.onesAndTwos]
)

// Player Rosters

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

let sampleFriendsTwo: [User] = [
    User(
        name: "Ethan",
        city: "Fullerton",
        state: .california,
        experienceLevel: .recreational,
        positions: [.pointGuard, .shootingGuard],
        gamePreferences: [.threeOnThree, .fiveOnFive],
        scoringPreferences: [.onesAndTwos]
    ),

    User(
        name: "Cameron",
        city: "Whittier",
        state: .california,
        experienceLevel: .highSchool,
        positions: [.shootingGuard, .smallForward],
        gamePreferences: [.oneOnOne, .threeOnThree, .fiveOnFive],
        scoringPreferences: [.onesAndTwos]
    ),

    User(
        name: "Isaiah",
        city: "Downey",
        state: .california,
        experienceLevel: .college,
        positions: [.smallForward, .powerForward],
        gamePreferences: [.threeOnThree, .fiveOnFive],
        scoringPreferences: [.twosAndThrees]
    ),

    User(
        name: "Noah",
        city: "Cerritos",
        state: .california,
        experienceLevel: .recreational,
        positions: [.powerForward, .center],
        gamePreferences: [.threeOnThree, .fiveOnFive],
        scoringPreferences: [.onesAndTwos, .twosAndThrees]
    ),

    User(
        name: "Julian",
        city: "Lakewood",
        state: .california,
        experienceLevel: .highSchool,
        positions: [.center],
        gamePreferences: [.fiveOnFive],
        scoringPreferences: [.twosAndThrees]
    )
]

// Teams

let teamOne = Team(
    name: "LA Lions",
    city: "Los Angeles",
    state: .california,
    roster: sampleFriends
)

let teamTwo = Team(
    name: "Torrance Cowboys",
    city: "Torrance",
    state: .california,
    roster: sampleFriends
)

let sampleUserTeams: [Team] = [
    Team(
        name: "LA Ballers",
        city: "Los Angeles",
        state: .california,
        roster: [
            sampleCurrentUser,
            sampleFriends[0],
            sampleFriends[1],
            sampleFriends[2],
            sampleFriends[3]
        ]
    ),

    Team(
        name: "South Bay Hoops",
        city: "Torrance",
        state: .california,
        roster: [
            sampleCurrentUser,
            sampleFriends[1],
            sampleFriends[2],
            sampleFriends[3],
            sampleFriends[4]
        ]
    )
]


let sampleOpponentTeams: [Team] = [
    Team(
        name: "Cerritos Five",
        city: "Cerritos",
        state: .california,
        roster: [
            sampleFriendsTwo[0],
            sampleFriendsTwo[1],
            sampleFriendsTwo[2],
            sampleFriendsTwo[3],
            sampleFriendsTwo[4]
        ]
    ),

    Team(
        name: "OC Elite",
        city: "Fullerton",
        state: .california,
        roster: [
            sampleFriendsTwo[0],
            sampleFriendsTwo[1],
            sampleFriendsTwo[2],
            sampleFriendsTwo[3],
            sampleFriendsTwo[4]
        ]
    ),

    Team(
        name: "Gateway Hoops",
        city: "Whittier",
        state: .california,
        roster: [
            sampleFriendsTwo[0],
            sampleFriendsTwo[1],
            sampleFriendsTwo[2],
            sampleFriendsTwo[3],
            sampleFriendsTwo[4]
        ]
    )
]

let sampleGame: Game = Game(
    teamOne: teamStateOne,
    teamTwo: teamStateTwo,
    scoringFormat: .onesAndTwos,
    gameFormat: .oneOnOne
)

// Team States

let teamStateOne = TeamGameState(
    team: teamOne,
    score: 1,
    timeoutsRemaining: 2
)

let teamStateTwo = TeamGameState(
    team: teamTwo,
    score: 0,
    timeoutsRemaining: 2
)

let laBallersState = TeamGameState(
    team: sampleUserTeams[0],
    score: 8,
    timeoutsRemaining: 2
)

let southBayHoopsState = TeamGameState(
    team: sampleUserTeams[1],
    score: 14,
    timeoutsRemaining: 1
)

let cerritosFiveState = TeamGameState(
    team: sampleOpponentTeams[0],
    score: 6,
    timeoutsRemaining: 2
)

let ocEliteState = TeamGameState(
    team: sampleOpponentTeams[1],
    score: 12,
    timeoutsRemaining: 1
)

let gatewayHoopsState = TeamGameState(
    team: sampleOpponentTeams[2],
    score: 17,
    timeoutsRemaining: 0
)


// Games

let sampleGames: [Game] = [
    Game(
        teamOne: laBallersState,
        teamTwo: cerritosFiveState,
        scoringFormat: .onesAndTwos,
        gameFormat: .fiveOnFive
    ),

    Game(
        teamOne: southBayHoopsState,
        teamTwo: ocEliteState,
        scoringFormat: .twosAndThrees,
        gameFormat: .fiveOnFive
    ),

    Game(
        teamOne: laBallersState,
        teamTwo: gatewayHoopsState,
        scoringFormat: .onesAndTwos,
        gameFormat: .threeOnThree
    ),

    Game(
        teamOne: southBayHoopsState,
        teamTwo: cerritosFiveState,
        scoringFormat: .onesAndTwos,
        gameFormat: .threeOnThree
    ),

    Game(
        teamOne: laBallersState,
        teamTwo: ocEliteState,
        scoringFormat: .twosAndThrees,
        gameFormat: .fiveOnFive
    )
]
