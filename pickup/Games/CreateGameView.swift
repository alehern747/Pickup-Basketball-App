import SwiftUI

struct CreateGameView: View {
    let userTeams: [Team]
    let oppTeams: [Team]
    
    @State private var selectedTeam: UUID?
    @State private var selectedOpponent: UUID?
    @State private var selectedScoringFormat: ScoringFormat = .onesAndTwos
    @State private var selectedGameFormat: GameFormat = .oneOnOne
    @State private var selectedTarget: Int = 12
    @State private var numTimeouts: Int = 0

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Your Team: ")
                Spacer()
                // replace sample with teams from user's stored in db
                Picker("Team One", selection: $selectedTeam) {
                    Text("Select Team").tag(nil as UUID?)
                    ForEach(sampleUserTeams) { team in
                        Text("\(team.name) (\(team.wins)-\(team.losses))")
                        .tag(team.id as UUID?)
                    }
                }
            }
            HStack {
                Text("Opposing Team: ")
                // replace with picker from ?? search function in db
                Spacer()
                Picker("Team Two", selection: $selectedOpponent) {
                    Text("Select Opponent").tag(nil as UUID?)
                    ForEach(sampleOpponentTeams) { team in
                        Text("\(team.name) (\(team.wins)-\(team.losses))")
                        .tag(team.id as UUID?)
                    }
                }
            }
            HStack {
                Text("Scoring Format: ")
                Spacer()
                EnumPicker(title: "Scoring", selection: $selectedScoringFormat)
            }
            HStack {
                Text("Game Format: ")
                Spacer()
                EnumPicker(title: "Game", selection: $selectedGameFormat)
            }
            HStack {
                Text("Target Score: ")
                Spacer()
                TextField("__", value: $selectedTarget, format: .number)
                    .keyboardType(.numberPad)
                    .frame(width: 40)
                // add digit limit or other check
            }
            HStack {
                Text("Number of Timeouts: ")
                Spacer()
                TextField("__", value: $numTimeouts, format: .number)
                    .keyboardType(.numberPad)
                    .frame(width: 40)
            }
            // win by 2 setting?
            // time and date? schedule games for later on
        }.padding()
        
        Button("Create Game") {
            guard let teamOne = sampleUserTeams.first(where: { $0.id == selectedTeam }),
                      let teamTwo = sampleOpponentTeams.first(where: { $0.id == selectedOpponent })
                else {
                    return
                }
            
            let game = Game(
                teamOne: TeamGameState(
                    team: teamOne,
                    timeoutsRemaining: numTimeouts
                ),
                teamTwo: TeamGameState(
                    team: teamTwo,
                    timeoutsRemaining: numTimeouts
                ),
                scoringFormat: selectedScoringFormat,
                gameFormat: selectedGameFormat,
                targetScore: selectedTarget
            )
            
            // onCreate(team) logic for creating a game and storing it
        }.padding()
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    CreateGameView(userTeams: sampleUserTeams, oppTeams: sampleOpponentTeams)
}
