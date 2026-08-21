#if canImport(SwiftUI)
    import SwiftUI

    extension DarkModeColor.Theme.Preview {

        struct Section: View {
            let title: String
            let colors: [(name: String, color: DarkModeColor)]
            let colorScheme: SwiftUI.ColorScheme

            private let columns = [
                GridItem(.adaptive(minimum: 120, maximum: 150), spacing: 12)
            ]
        }
    }

    extension DarkModeColor.Theme.Preview.Section {
        var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)

                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(colors, id: \.name) { item in
                        DarkModeColor.Theme.Preview.Swatch(
                            name: item.name,
                            htmlColor: item.color,
                            colorScheme: colorScheme
                        )
                    }
                }
            }
        }
    }
#endif
