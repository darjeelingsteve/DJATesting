//
//  Decodable+Testing.swift
//  DJATesting
//
//  Created by Stephen Anthony on 18/05/2021.
//

import Foundation

public extension Decodable {
    
    /// Parses a JSON file that is part of the testing bundle in to the type
    /// that the function is called on.
    /// - Parameters:
    ///   - fileName: The name of the JSON file to be parsed.
    ///   - bundle: The bundle in which to locate the JSON file.
    /// - Throws: The error produced attempting to locate or decode the
    /// specified JSON file.
    /// - Returns: An instance of the receiving type parsed from the JSON in the
    /// file with the given name.
    static func from(fileName: String, inBundle bundle: Bundle) throws -> Self {
        guard let fileURL = bundle.url(forResource: fileName, withExtension: "json") else {
            throw NSError(domain: "DJATesting",
                          code: 0,
                          userInfo: [NSLocalizedDescriptionKey: "No file found named \(fileName).json in bundle at \(bundle.bundleURL)"])
        }
        return try JSONDecoder().decode(Self.self, from: Data(contentsOf: fileURL))
    }
}
