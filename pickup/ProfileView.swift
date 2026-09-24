import SwiftUI

struct ProfileView: View {
    let user = User()
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle")
            Text(user.name).font(.title)
            Text("\(user.city), \(user.state)")
        }
        
        VStack(alignment: .leading) {
            Divider()
            
            profileSection(title: "Position", tags: user.positions.map { $0.rawValue })
            
            Divider()
            
            profileSection(title: "Experience", tags: [user.experienceLevel.rawValue])
            
            Divider()

            profileSection(title: "Preferences", tags: user.gamePreferences.map {$0.rawValue} + user.scoringPreferences.map{ $0.rawValue })
        }
        .padding(.horizontal, 20)
        .padding()
        
        VStack {
            Button("Game Log", action: {
                print("Navigate to game log") // Go to new screen
            })
        }
        .buttonStyle(.borderedProminent)
    }
        
    func profileSection(title: String, tags: [String]) -> some View {
        let columns = [
            GridItem(.adaptive(minimum: 105), spacing: 8)
        ]

        return VStack(alignment: .leading) {
            Text(title).bold()
            
            LazyVGrid(columns: columns, alignment: .leading) {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 5)
                        .background(.gray.opacity(0.4))
                        .clipShape(Capsule())
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
