//
//  MediaMetadata.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 01/06/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import ObjectMapper

public final class MediaMetadata: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let height = "height"
    static let format = "format"
    static let url = "url"
    static let width = "width"
  }

  // MARK: Properties
  public var height: Int?
  public var format: String?
  public var url: String?
  public var width: Int?

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
    height <- map[SerializationKeys.height]
    format <- map[SerializationKeys.format]
    url <- map[SerializationKeys.url]
    width <- map[SerializationKeys.width]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = height { dictionary[SerializationKeys.height] = value }
    if let value = format { dictionary[SerializationKeys.format] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    if let value = width { dictionary[SerializationKeys.width] = value }
    return dictionary
  }
}
