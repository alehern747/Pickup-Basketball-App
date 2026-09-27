import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []

    var body: some View {
        CreateProfileView { user in users.append(user)
        }
    }
}

#Preview {
    ContentView()
}
