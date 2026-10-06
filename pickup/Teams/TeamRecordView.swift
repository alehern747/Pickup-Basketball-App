import SwiftUI

struct TeamRecordView: View {
    let userTeams: [Team]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            RecordList(
                items: userTeams,
                destination: { team in
                    TeamView(team: team)
                },
                row: { team in
                    teamRecordRow(team: team)
                }
            )
            
            AddButton(
                destination: CreateTeamView(
                    currentUser: sampleCurrentUser,
                    friends: sampleFriends
                )
            )
        }
    }
        
    func teamRecordRow(team: Team) -> some View {
        return VStack(alignment: .leading) {
            Text("\(team.name)")
            Text("\(team.city), \(team.state)")
            Text("\(team.wins)-\(team.losses)")
        }.frame(maxWidth: .infinity, minHeight: 100, alignment: .leading)
            .foregroundStyle(.black)
            .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        TeamRecordView(userTeams: sampleUserTeams)
    }
}
