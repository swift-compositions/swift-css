public import CSS_Theming
import Foundation

extension DarkModeColor.Theme.StyleSheet {
    public func write(
        to directory: String,
        name: String = "theme"
    ) throws(DarkModeColor.Theme.StyleSheet.Foundation.Error) {

        do {
            try FileManager.default.createDirectory(
                atPath: directory,
                withIntermediateDirectories: true,
                attributes: nil
            )
        } catch {
            throw .directoryCreationFailed(path: directory, reason: String(describing: error))
        }

        let path = directory + "\(name).css"

        do {
            try self.description.write(
                toFile: path,
                atomically: true,
                encoding: .utf8
            )
        } catch {
            throw .fileWriteFailed(path: path, reason: String(describing: error))
        }
    }
}
