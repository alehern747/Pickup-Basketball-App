import SwiftUI

struct GameLogView: View {
    let userGames: [Game]
    // how to order recently updated? timestamps / dates?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            RecordList(
                items: userGames,
                destination: { game in
                    GameView(game: game)
                },
                row: { game in
                    gameLogRow(game: game)
                }
            )
            
            AddButton(
                destination: CreateGameView(
                    userTeams: sampleUserTeams,
                    oppTeams: sampleOpponentTeams
                )
            )
        }
    }
    
    func gameLogRow(game: Game) -> some View {
        return VStack {
            Text("\(game.teamOne.team.name) (\(game.teamOne.score)) vs. \(game.teamTwo.team.name) (\(game.teamTwo.score))")
            HStack {
                // later, some kind of win/loss symbol?
                Text("\(game.scoringFormat.rawValue)")
                Text("\(game.gameFormat.rawValue)")
            }
            Text("\(game.status.rawValue)")
        }.frame(maxWidth: .infinity, minHeight: 100)
            .foregroundStyle(.black)
    }
}

#Preview {
    NavigationStack {
        GameLogView(userGames: sampleGames)
    }
}
