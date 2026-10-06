import SwiftUI


struct CreateProfileView: View {
    @State private var displayName: String = ""
    @State private var city: String = ""
    @State private var selectedState: USState = .alabama
    @State private var selectedLevel: ExperienceLevel = .none
    @State private var selectedPositions: Set<Position> = []
    @State private var selectedGamePrefs: Set<GameFormat> = []
    @State private var selectedScoringPrefs: Set<ScoringFormat> = []
    @State private var profileCreated = false
    @State private var createdUser: User?
    
    var onCreate: (User) -> Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // apply limits on names, with visible character count
                textFieldRow("Name", text: $displayName)
                textFieldRow("City", text: $city)
                
                HStack {
                    Text("State:")
                    EnumPicker(title: "State", selection: $selectedState)
                }
                HStack {
                    Text("Experience Level:")
                    EnumPicker(title: "Experience Level", selection: $selectedLevel)
                }
                
                multiSelectionSection(
                    title: "Positions Played",
                    options: Position.allCases,
                    selection: $selectedPositions,
                    height: 280
                )

                multiSelectionSection(
                    title: "Game Preferences",
                    options: GameFormat.allCases,
                    selection: $selectedGamePrefs,
                    height: 180
                )

                multiSelectionSection(
                    title: "Scoring Preferences",
                    options: ScoringFormat.allCases,
                    selection: $selectedScoringPrefs,
                    height: 100
                )
            }.padding()
            
            Button("Create Profile") {
                let user = User(
                    name: displayName,
                    city: city,
                    state: selectedState,
                    experienceLevel: selectedLevel,
                    positions: selectedPositions,
                    gamePreferences: selectedGamePrefs,
                    scoringPreferences: selectedScoringPrefs
                )
                
                onCreate(user)
                createdUser = user
                profileCreated = true
            }.padding()
            .buttonStyle(.borderedProminent)
            .navigationDestination(isPresented: $profileCreated) {
                if let user = createdUser {
                    ProfileView(user: user)
                }
            }
        }
    }
        
    
    func multiSelectionSection<T>(title: String, options: [T], selection: Binding<Set<T>>, height: CGFloat) -> some View where T: Hashable, T: RawRepresentable, T.RawValue == String {
        
        VStack(alignment: .leading) {
            Text(title)

            List(options, id: \.self, selection: selection) { option in
                Text(option.rawValue)
            }
            .environment(\.editMode, .constant(.active))
            .listStyle(.plain)
            .frame(height: height)
        }
    }
}

#Preview {
    NavigationStack {
        CreateProfileView { user in }
    }
}
