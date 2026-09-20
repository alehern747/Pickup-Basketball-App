import SwiftUI

struct GameView: View {
    @State var game = Game()
    
    var body: some View {
        VStack(spacing: 20) {
            Text(game.status.rawValue)
            HStack {
                VStack {
                    Text(game.teamOne.team.name).font(.largeTitle)
                    // logos should go here too
                    // clicking logo/text should go to team page
                    Text(String(game.teamOne.score)).font(.title)
                }
                
                Spacer()
                
                VStack {
                    Text(game.teamTwo.team.name).font(.largeTitle)
                    Text(String(game.teamTwo.score)).font(.title)
                }
            }
            
            // timer?
            
            // court view with player rosters here
            
            // extra details below that, at the bottom
            
            Spacer()
        }.padding(30)
    }
    
    func incrementScore() {
        
    }
}

#Preview {
    GameView()
}
