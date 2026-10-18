import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            // title view here eventually
            // GameLogView(userGames: sampleGames)
            MapView()
            // CreateProfileView { user in } // users.append(user) }
        }
    }
}

#Preview {
    ContentView()
}
