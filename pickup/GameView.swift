import SwiftUI

struct GameView: View {
    @State var game = Game()
    
    var body: some View {
        VStack(spacing: 20) {
            Text(game.status.rawValue)
            HStack {
                teamScoringControls(side: .teamOne)
                
                Spacer()
                
                teamScoringControls(side: .teamTwo)
            }
            
            // timer?
            // court view with player rosters here
            // extra details below that, at the bottom
            
            Spacer()
        }.padding(30)
    }
    
    func teamScoringControls(side: GameSide) -> some View {
        let teamState = game.team(for: side)
        
        return VStack {
            Text(teamState.team.name).font(.largeTitle)
            // logos should go here too
            // clicking logo/text should go to team page
            
            Text(String(teamState.score)).font(.largeTitle)
            
            HStack {
                scoringButton(amount: game.scoringFormat.pointValues[0], side: side)
                scoringButton(amount: game.scoringFormat.pointValues[1], side: side)
            }
        }
    }
    
    func scoringButton(amount: Int, side: GameSide) -> some View {
        return Button("+\(amount)", action: {
            game.addPoints(amount, to: side)
        }).font(.title)
    }
    
}

#Preview {
    GameView()
}
