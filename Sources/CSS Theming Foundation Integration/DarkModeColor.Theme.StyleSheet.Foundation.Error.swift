//
//  DarkModeColor.Theme.StyleSheet.Foundation.Error.swift
//  swift-css
//

public import CSS_Theming

extension DarkModeColor.Theme.StyleSheet.Foundation {
    /// A failure writing a generated stylesheet to disk.
    public enum Error: Swift.Error, Sendable {
        /// The theme directory could not be created.
        case directoryCreationFailed(path: String, reason: String)

        /// The generated stylesheet could not be written to disk.
        case fileWriteFailed(path: String, reason: String)
    }
}
