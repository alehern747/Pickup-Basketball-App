import SwiftUI

struct GameLogView: View {
    let userGames: [Game]
    // how to order recently updated? timestamps / dates?
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach (userGames) { game in
                    NavigationLink {
                        GameView(game: game)
                    } label: {
                        gameLogRow(game: game)
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .overlay(.black)
                }
            }.border(.black, width: 1)
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
    GameLogView(userGames: sampleGames)
}
