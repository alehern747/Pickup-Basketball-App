import SwiftUI

struct CreateTeamView: View {
    let currentUser: User
    let friends: [User]

    @State private var teamName: String = ""
    @State private var teamCity: String = ""
    @State private var teamState: USState = .alabama
    @State private var selectedFriend: UUID?
    @State private var roster: [User] = []
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Team Name").bold()
            TextField("\(currentUser.name)'s Team", text: $teamName)
            
            Text("Location").bold()
            textFieldRow("City", text: $teamCity)
            
            HStack {
                Text("State:")
                Picker("State", selection: $teamState) {
                    ForEach(USState.allCases, id: \.self) { state in
                        Text(state.rawValue)
                    }
                }
            }
            
            Text("Roster").bold()
            HStack {
                Picker("Select Teammate", selection: $selectedFriend) {
                    Text("Select Teammate").tag(nil as UUID?)
                    ForEach(friends) {
                        friend in Text(friend.name)
                        .tag(friend.id as UUID?)}
                }.background(.gray.opacity(0.15))

                Spacer()
                
                Button("Add") {
                    addSelectedFriend()
                }
            }
            
            ForEach(roster) { teammate in
                HStack {
                    Text(teammate.name)
                    Button("Remove") {
                        removeTeammate(teammate)
                    }
                }
            }
        }.padding()
        
        Button("Create Team") {
            let team = Team(
                name: teamName,
                city: teamCity,
                state: teamState,
                roster: roster
            )
            
            // onCreate(team) logic for creating a team and using it
        }.padding()
        .buttonStyle(.borderedProminent)
    }
    
    func addSelectedFriend() {
        if let friend = friends.first(where: { $0.id == selectedFriend }), !roster.contains(where: { $0.id == friend.id }) {
            roster.append(friend)
        }
    }
    
    func removeTeammate(_ teammate: User) {
        roster.removeAll { $0.id == teammate.id }
    }
}

#Preview {
    CreateTeamView(currentUser: sampleCurrentUser, friends: sampleFriends)
}
