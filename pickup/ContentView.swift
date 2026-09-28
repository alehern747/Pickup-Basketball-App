import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    // @State private var teams: [Team] = []
    // @State private var games: [Game] = []

    var body: some View {
        CreateProfileView { user in users.append(user) }
    }
}

#Preview {
    ContentView()
}
