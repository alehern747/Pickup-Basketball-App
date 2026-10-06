import SwiftUI

// add search functionality
struct PlaybookView: View {
    var body: some View {
        RecordList(
            items: PlayLibrary.allPlays,
            destination: { play in
                PlayView(play: play)
            },
            row: { play in
                playbookRow(play: play)
            }
        )
    }
    
    func playbookRow(play: Play) -> some View {
        return VStack(alignment: .leading) {
            Text("\(play.name)")
            Text(play.altNames
                    .joined(separator: ", ")
            )
            tagSection(title: "play", tags: play.tags.map { $0.rawValue })
        }.frame(maxWidth: .infinity, minHeight: 100)
            .foregroundStyle(.black)
            .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        PlaybookView()
    }
}
