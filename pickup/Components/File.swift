import Foundation
import SwiftUI

func textFieldRow(_ title: String, text: Binding<String>) -> some View {
    HStack {
        Text("\(title):")
        TextField("Here", text: text)
    }
}
