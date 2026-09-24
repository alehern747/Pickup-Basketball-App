import SwiftUI


struct CreateProfileView: View {
    @State private var displayName: String = ""
    @State private var city: String = ""
    @State private var selectedState: USState = .alabama
    @State private var selectedLevel: ExperienceLevel = .none
    @State private var selectedPositions: Set<Position> = []
    @State private var selectedGamePrefs: Set<GameFormat> = []
    @State private var selectedScoringPrefs: Set<ScoringFormat> = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // apply limits on names, with visible character count
                HStack {
                    Text("Name:")
                    TextField("Here", text: $displayName)
                }
                HStack {
                    Text("City:")
                    TextField("Here", text: $city)
                }
                HStack {
                    Text("State:")
                    Picker("State", selection: $selectedState) {
                        ForEach(USState.allCases, id: \.self) { state in
                            Text(state.rawValue)
                        }
                    }
                }
                HStack {
                    Text("Experience Level:")
                    Picker("State", selection: $selectedLevel) {
                        ForEach(ExperienceLevel.allCases, id: \.self) { level in
                            Text(level.rawValue)
                        }
                    }
                }
                
                // revise this with auto framing?
                Text("Positions Played")
                List(Position.allCases, id: \.self, selection: $selectedPositions) {
                    Text("\($0.rawValue)")
                }.environment(\.editMode, .constant(EditMode.active))
                    .listStyle(.plain)
                    .frame(height: 280)
                
                Text("Game Preferences")
                List(GameFormat.allCases, id: \.self, selection: $selectedGamePrefs) {
                    Text("\($0.rawValue)")
                }.environment(\.editMode, .constant(EditMode.active))
                    .listStyle(.plain)
                    .frame(height: 180)
                
                Text("Scoring Preferences")
                List(ScoringFormat.allCases, id: \.self, selection: $selectedScoringPrefs) {
                    Text("\($0.rawValue)")
                }.environment(\.editMode, .constant(EditMode.active))
                    .listStyle(.plain)
                    .frame(height: 100)
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
            }.padding()
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    CreateProfileView()
}
