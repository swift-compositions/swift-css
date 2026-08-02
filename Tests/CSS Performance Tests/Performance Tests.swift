// Performance Tests.swift
// swift-html-css-pointfree
//
// Top-level performance test suite with serialized execution.
// All performance tests extend this suite via extension in their respective test files.

import CSS_Test_Support
import Testing

@Suite(.serialized)
struct `Performance Tests` {}
