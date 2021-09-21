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
    ///   - dateDecodingStrategy: The data decoding strategy to use.
    ///   - keyDecodingStrategy: The key decoding strategy to use.
    ///   - dataDecodingStrategy: The data decoding strategy to use.
    /// - Throws: The error produced attempting to locate or decode the
    /// specified JSON file.
    /// - Returns: An instance of the receiving type parsed from the JSON in the
    /// file with the given name.
    static func from(fileName: String, inBundle bundle: Bundle, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy? = nil, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy? = nil, dataDecodingStrategy: JSONDecoder.DataDecodingStrategy? = nil) throws -> Self {
        guard let fileURL = bundle.url(forResource: fileName, withExtension: "json") else {
            throw NSError(domain: "DJATesting",
                          code: 0,
                          userInfo: [NSLocalizedDescriptionKey: "No file found named \(fileName).json in bundle at \(bundle.bundleURL)"])
        }
        let decoder = JSONDecoder()
        if let dateDecodingStrategy = dateDecodingStrategy {
            decoder.dateDecodingStrategy = dateDecodingStrategy
        }
        if let keyDecodingStrategy = keyDecodingStrategy {
            decoder.keyDecodingStrategy = keyDecodingStrategy
        }
        if let dataDecodingStrategy = dataDecodingStrategy {
            decoder.dataDecodingStrategy = dataDecodingStrategy
        }
        return try decoder.decode(Self.self, from: Data(contentsOf: fileURL))
    }
}
