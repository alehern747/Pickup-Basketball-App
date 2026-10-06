import SwiftUI

enum HomeTab: String, CaseIterable {
    case profile = "Profile"
    case teams = "Teams"
    case games = "Games"
    case plays = "Plays"
    case search = "Search"
}

struct HomeView: View {
    @State private var selectedTab: HomeTab = .profile
    
    var body: some View {
        HStack {
            ForEach(HomeTab.allCases, id: \.self) { tab in
                Text(tab.rawValue)
                    .fontWeight(selectedTab == tab ? .bold : .regular)
            }
        }
        // later: change to data of authenticated user
        TabView(selection: $selectedTab) {
            ProfileView(user: sampleCurrentUser)
                .tag(HomeTab.profile)
            TeamRecordView(userTeams: sampleUserTeams)
                .tag(HomeTab.teams)
                // add new team should be on the top?
            GameLogView(userGames: sampleGames)
                .tag(HomeTab.games)
                // add new game should be at the top? + search
            // searches
                // then what is the search for?
        }.tabViewStyle(.page(indexDisplayMode: .never))
        
        // highlight current tab
    }
}

#Preview {
    HomeView()
}
