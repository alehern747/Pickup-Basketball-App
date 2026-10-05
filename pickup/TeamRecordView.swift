import SwiftUI

struct TeamRecordView: View {
    let userTeams: [Team]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach (userTeams) { team in
                        NavigationLink {
                            TeamView(team: team)
                        } label: {
                            teamRecordRow(team: team)
                        }
                        Divider()
                            .frame(height: 1)
                            .overlay(.black)
                    }
                }.border(.black, width: 1)
            }
            
            NavigationLink {
                // sample data
                CreateTeamView(currentUser: sampleCurrentUser, friends: sampleFriends)
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .frame(width: 50, height: 60)
            }.buttonStyle(.borderedProminent)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding()
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
