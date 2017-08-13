//
// RegexManager.swift
// MyFirstSAPiOSApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 13/08/17
//

import Foundation

class RegexManager {
    private let internalExpression: NSRegularExpression
    private let pattern: String

    init(_ pattern: String) {
        self.pattern = pattern
        self.internalExpression = try! NSRegularExpression(pattern: pattern, options: [])
    }

    func test(input: String) -> Bool {
        let matches = self.internalExpression.matches(in: input, options: [], range: NSRange(location: 0, length: input.characters.count))
        return !matches.isEmpty
    }
}
