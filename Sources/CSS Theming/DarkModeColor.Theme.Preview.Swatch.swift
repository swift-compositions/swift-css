//
//  DarkModeColor.Theme.Preview.Swatch.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 12/09/2025.
//

#if canImport(SwiftUI)
    import SwiftUI

    extension DarkModeColor.Theme.Preview {
        /// Individual color swatch showing the color and its name
        struct Swatch: View {
            let name: String
            let htmlColor: DarkModeColor
            let colorScheme: SwiftUI.ColorScheme
            @State private var isHovering = false

            // Explicit memberwise initializer: the synthesized one would be
            // `private` because `isHovering` is a private stored property,
            // making the type uninitializable from sibling files in the
            // same target (e.g. `DarkModeColor.Theme.Preview.Section`).
            init(name: String, htmlColor: DarkModeColor, colorScheme: SwiftUI.ColorScheme) {
                self.name = name
                self.htmlColor = htmlColor
                self.colorScheme = colorScheme
            }
        }
    }

    extension DarkModeColor.Theme.Preview.Swatch {
        var swiftUIColor: SwiftUI.Color {
            htmlColor.toSwiftUIColor(for: colorScheme)
        }

        var hexValue: String {
            let cssColor = colorScheme == .light ? htmlColor.light : htmlColor.dark
            switch cssColor {
            case .hex(let value):
                return "#\(value)"

            case .rgb(let r, let g, let b):
                return String(format: "#%02X%02X%02X", Int(r), Int(g), Int(b))

            case .rgba(let r, let g, let b, let a):
                return String(format: "#%02X%02X%02X%02X", Int(r), Int(g), Int(b), Int(a * 255))

            default:
                return cssColor.description
            }
        }

        var body: some View {
            VStack(spacing: 6) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(swiftUIColor)
                    .frame(height: 60)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.primary.opacity(0.2), lineWidth: 1)
                    )
                    .overlay(
                        Text(isHovering ? hexValue : "")
                            .font(.caption.monospaced())
                            .foregroundColor(
                                // Determine text color based on background brightness
                                isLightColor(swiftUIColor) ? .black : .white
                            )
                            .padding(4)
                            .background(
                                isHovering
                                    ? Color.black.opacity(isLightColor(swiftUIColor) ? 0.1 : 0.3)
                                    : .clear
                            )
                            .cornerRadius(4)
                            .opacity(isHovering ? 1 : 0)
                            .animation(.easeInOut(duration: 0.2), value: isHovering)
                    )
                    #if os(macOS) || os(iOS) || os(visionOS)
                        .onHover { hovering in
                            isHovering = hovering
                        }
                    #endif

                Text(name)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }

        /// Determine if a color is light or dark for text contrast
        func isLightColor(_ color: SwiftUI.Color) -> Bool {
            // This is a simplified brightness calculation
            // In production, you'd want to extract RGB values properly
            return colorScheme == .light
                && (htmlColor.light.description.contains("fff")
                    || htmlColor.light.description.contains("white"))
        }
    }
#endif
