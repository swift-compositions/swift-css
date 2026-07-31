//
//  DarkModeColor.Theme.StyleSheet.Write.swift
//  swift-css
//
//  Writes a generated theme stylesheet to disk via Foundation's file system APIs.
//

public import CSS_Theming
import Foundation

extension DarkModeColor.Theme.StyleSheet {
    public func write(
        to directory: String,
        name: String = "theme"
    ) throws(DarkModeColor.Theme.StyleSheet.Foundation.Error) {
        // swift-linter:disable:next do throws for typed catch
        // REASON: FileManager.createDirectory(atPath:withIntermediateDirectories:attributes:)
        // is a cross-module Foundation API that throws untyped `any Error`; there is no `E`
        // to name in `do throws(E)`.
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
        // swift-linter:disable:next do throws for typed catch
        // REASON: String.write(toFile:atomically:encoding:) is a cross-module Foundation API
        // that throws untyped `any Error`; there is no `E` to name in `do throws(E)`.
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
