//
//  Media.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 01/06/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import ObjectMapper

public final class Media: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let copyright = "copyright"
    static let type = "type"
    static let subtype = "subtype"
    static let mediaMetadata = "media-metadata"
    static let caption = "caption"
  }

  // MARK: Properties
  public var copyright: String?
  public var type: String?
  public var subtype: String?
  public var mediaMetadata: MediaMetadata?
  public var caption: String?

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
    type <- map[SerializationKeys.type]
    subtype <- map[SerializationKeys.subtype]
    mediaMetadata <- map[SerializationKeys.mediaMetadata]
    caption <- map[SerializationKeys.caption]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = copyright { dictionary[SerializationKeys.copyright] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = subtype { dictionary[SerializationKeys.subtype] = value }
    if let value = mediaMetadata { dictionary[SerializationKeys.mediaMetadata] = value.dictionaryRepresentation() }
    if let value = caption { dictionary[SerializationKeys.caption] = value }
    return dictionary
  }
    
    var isImage: Bool {
        return type == "image"
    }

}
