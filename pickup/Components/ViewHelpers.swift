import Foundation
import SwiftUI

func textFieldRow(_ title: String, text: Binding<String>) -> some View {
    HStack {
        Text("\(title):")
        TextField("Here", text: text)
    }
}

func tagSection(title: String, tags: [String]) -> some View {
    let columns = [
        GridItem(.adaptive(minimum: 105), spacing: 8)
    ]

    return VStack(alignment: .leading) {        
        LazyVGrid(columns: columns, alignment: .leading) {
            ForEach(tags, id: \.self) { tag in
                Text(tag)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 5)
                    .background(.gray.opacity(0.4))
                    .clipShape(Capsule())
            }
        }
    }
}

struct RecordList<Item: Identifiable, Row: View, Destination: View>: View {
    let items: [Item]
    let destination: (Item) -> Destination
    let row: (Item) -> Row

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(items) { item in
                    NavigationLink {
                        destination(item)
                    } label: {
                        row(item)
                    }

                    Divider()
                        .frame(height: 1)
                        .overlay(.black)
                }
            }
            .border(.black, width: 1)
        }
    }
}

struct AddButton<Destination: View>: View {
    let destination: Destination

    var body: some View {
        NavigationLink {
            destination
        } label: {
            Image(systemName: "plus")
                .font(.title)
                .frame(width: 50, height: 60)
        }
        .buttonStyle(.borderedProminent)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding()
    }
}
