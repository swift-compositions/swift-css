//
//  Font.Defaults Concurrency Tests.swift
//  swift-css
//
//  Regression coverage for F-002: the global prepared font-defaults storage must
//  stay internally consistent under concurrent `_prepare` writes and `current` reads.
//

import CSS
import CSS_Theming
import Testing

extension CSS_Theming.Font.Defaults {
    @Suite
    struct `Edge Case` {

        @Test
        func `prepare and current never observe a torn value under concurrent access`() async {
            let snapshotA: CSS_Theming.Font.Defaults = {
                var defaults = CSS_Theming.Font.Defaults.default
                let marker = CSS_Theming.Font(
                    family: .systemUi,
                    size: .rem(1),
                    stretch: .normal,
                    style: .normal,
                    variant: .normal,
                    weight: .bold,
                    lineHeight: 1
                )
                defaults.title = marker
                defaults.body = marker
                return defaults
            }()

            let snapshotB: CSS_Theming.Font.Defaults = {
                var defaults = CSS_Theming.Font.Defaults.default
                let marker = CSS_Theming.Font(
                    family: .systemUi,
                    size: .rem(2),
                    stretch: .normal,
                    style: .normal,
                    variant: .normal,
                    weight: .light,
                    lineHeight: 2
                )
                defaults.title = marker
                defaults.body = marker
                return defaults
            }()

            defer { CSS_Theming.Font.Defaults._prepare(.default) }

            // Seed synchronously before any concurrent access starts: otherwise a
            // reader task can legitimately run before the first writer task, observing
            // the pre-test `.default` value (which matches neither snapshot) and
            // producing a false-positive "torn value" report unrelated to the fix
            // under test.
            CSS_Theming.Font.Defaults._prepare(snapshotA)

            await withTaskGroup(of: Void.self) { group in
                for i in 0..<4_000 {
                    group.addTask {
                        CSS_Theming.Font.Defaults._prepare(
                            i.isMultiple(of: 2) ? snapshotA : snapshotB
                        )
                    }
                    group.addTask {
                        let observed = CSS_Theming.Font.Defaults.current
                        let matchesA =
                            observed.title == snapshotA.title && observed.body == snapshotA.body
                        let matchesB =
                            observed.title == snapshotB.title && observed.body == snapshotB.body
                        #expect(
                            matchesA || matchesB,
                            "observed a torn Font.Defaults mixing fields from two different prepared values"
                        )
                    }
                }
            }
        }
    }
}
