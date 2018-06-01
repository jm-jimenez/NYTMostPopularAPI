//
//  Results.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 01/06/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import ObjectMapper

public final class Results: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let abstract = "abstract"
    static let column = "column"
    static let source = "source"
    static let countType = "count_type"
    static let media = "media"
    static let geoFacet = "geo_facet"
    static let section = "section"
    static let desFacet = "des_facet"
    static let publishedDate = "published_date"
    static let title = "title"
    static let orgFacet = "org_facet"
    static let byline = "byline"
    static let url = "url"
    static let perFacet = "per_facet"
  }

  // MARK: Properties
  public var abstract: String?
  public var column: String?
  public var source: String?
  public var countType: String?
  public var media: [Media]?
  public var geoFacet: GeoFacet?
  public var section: String?
  public var desFacet: DesFacet?
  public var publishedDate: String?
  public var title: String?
  public var orgFacet: OrgFacet?
  public var byline: String?
  public var url: String?
  public var perFacet: PerFacet?

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
    abstract <- map[SerializationKeys.abstract]
    column <- map[SerializationKeys.column]
    source <- map[SerializationKeys.source]
    countType <- map[SerializationKeys.countType]
    media <- map[SerializationKeys.media]
    geoFacet <- map[SerializationKeys.geoFacet]
    section <- map[SerializationKeys.section]
    desFacet <- map[SerializationKeys.desFacet]
    publishedDate <- map[SerializationKeys.publishedDate]
    title <- map[SerializationKeys.title]
    orgFacet <- map[SerializationKeys.orgFacet]
    byline <- map[SerializationKeys.byline]
    url <- map[SerializationKeys.url]
    perFacet <- map[SerializationKeys.perFacet]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = abstract { dictionary[SerializationKeys.abstract] = value }
    if let value = column { dictionary[SerializationKeys.column] = value }
    if let value = source { dictionary[SerializationKeys.source] = value }
    if let value = countType { dictionary[SerializationKeys.countType] = value }
    if let value = media { dictionary[SerializationKeys.media] = value.map { $0.dictionaryRepresentation() } }
    if let value = geoFacet { dictionary[SerializationKeys.geoFacet] = value.dictionaryRepresentation() }
    if let value = section { dictionary[SerializationKeys.section] = value }
    if let value = desFacet { dictionary[SerializationKeys.desFacet] = value.dictionaryRepresentation() }
    if let value = publishedDate { dictionary[SerializationKeys.publishedDate] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = orgFacet { dictionary[SerializationKeys.orgFacet] = value.dictionaryRepresentation() }
    if let value = byline { dictionary[SerializationKeys.byline] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    if let value = perFacet { dictionary[SerializationKeys.perFacet] = value.dictionaryRepresentation() }
    return dictionary
  }
    
    var hasImages: Bool {
        if let filter = media?.filter({ $0.isImage }), filter.count > 0 { return true}
        else { return false }
    }
    
}
