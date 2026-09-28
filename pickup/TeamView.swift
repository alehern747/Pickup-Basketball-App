import SwiftUI

struct TeamView: View {
    let team: Team
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(team.name)").font(.largeTitle)
            Text("\(team.city), \(team.state)")
            Text("\(team.wins)-\(team.losses)")
            
            Text("Roster").font(.title)
            ForEach(team.roster, id: \.self) { teammate in
                HStack(spacing: 20) {
                    Text(teammate.name)
                    Text(teammate.positions
                            .map { $0.abbreviation }
                            .joined(separator: "/")
                    )
                }
            }
            
            // tabs to scheduled games?
            // recently played game log
            // roster
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        
    }
}

#Preview {
    TeamView(team: teamOne)
}
