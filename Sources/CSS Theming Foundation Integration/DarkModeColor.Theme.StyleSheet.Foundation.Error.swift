public import CSS_Theming

extension DarkModeColor.Theme.StyleSheet.Foundation {

    public enum Error: Swift.Error, Sendable {

        case directoryCreationFailed(path: String, reason: String)

        case fileWriteFailed(path: String, reason: String)
    }
}
