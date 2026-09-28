import SwiftUI

struct EnumPicker<T>: View
where T: Hashable & CaseIterable & RawRepresentable,
      T.RawValue == String,
      T.AllCases: RandomAccessCollection {

    let title: String
    @Binding var selection: T

    var body: some View {
        Picker(title, selection: $selection) {
            ForEach(T.allCases, id: \.self) { option in
                Text(option.rawValue)
            }
        }
    }
}
