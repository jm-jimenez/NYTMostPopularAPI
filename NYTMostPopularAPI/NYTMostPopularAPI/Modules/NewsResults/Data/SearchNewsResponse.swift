//
//  SearchNewsResponse.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 01/06/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import ObjectMapper

public final class SearchNewsResponse: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let copyright = "copyright"
    static let status = "status"
    static let results = "results"
    static let numResults = "num_results"
  }

  // MARK: Properties
  public var copyright: String?
  public var status: String?
  public var results: [Results]?
  public var numResults: Int?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public required init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public func mapping(map: Map) {
    copyright <- map[SerializationKeys.copyright]
    status <- map[SerializationKeys.status]
    results <- map[SerializationKeys.results]
    numResults <- map[SerializationKeys.numResults]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = copyright { dictionary[SerializationKeys.copyright] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = results { dictionary[SerializationKeys.results] = value.map { $0.dictionaryRepresentation() } }
    if let value = numResults { dictionary[SerializationKeys.numResults] = value }
    return dictionary
  }

}
