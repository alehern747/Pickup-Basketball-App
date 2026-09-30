import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            // title view here eventually
            // GameLogView(userGames: sampleGames)
            CreateProfileView { user in } // users.append(user) }
        }
    }
}

#Preview {
    ContentView()
}
