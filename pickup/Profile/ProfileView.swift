import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle")
            Text(user.name).font(.title)
            Text("\(user.city), \(user.state)")
            
            VStack(alignment: .leading) {
                Divider()
                
                Text("Position").bold()
                tagSection(title: "Position", tags: user.positions.map { $0.rawValue })
                
                Divider()
                
                Text("Experience").bold()
                tagSection(title: "Experience", tags: [user.experienceLevel.rawValue])
                
                Divider()
                
                Text("Preferences").bold()
                tagSection(title: "Preferences", tags: user.gamePreferences.map {$0.rawValue} + user.scoringPreferences.map{ $0.rawValue })
            }
            .padding(.horizontal, 20)
            .padding()
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    ProfileView(user: sampleCurrentUser)
}
