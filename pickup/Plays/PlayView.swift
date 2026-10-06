import SwiftUI

struct PlayView: View {
    let play: Play
    @State private var assignments: [PlayRole: User] = [:]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(play.name)").font(.title)
            Text(play.altNames
                    .joined(separator: ", ")
            )
            tagSection(title: "play", tags: play.tags.map { $0.rawValue })
            Text("\(play.description)")
            TabView {
                ForEach(play.diagrams) { diagram in
                    ZStack {
                        VStack {
                            Image(diagram.imageName)
                                .resizable()
                                .scaledToFit()
                                .overlay(alignment: .topTrailing) {
                                    Text("\(diagram.id) / \(play.diagrams.count)")
                                        .padding()
                                }
                        }
                    }
                }
            }.tabViewStyle(.page)
            .frame(height: 400)
            
            // ability to assign play, but only during game?
            // update assignments var
            // transition to actual unique PlayRoleView
        }.padding()
    }
}

#Preview {
    PlayView(play: PlayLibrary.pistolChicago)
}
