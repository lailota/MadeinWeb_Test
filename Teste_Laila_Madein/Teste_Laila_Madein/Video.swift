
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.welcomeTask(with: url) { welcome, response, error in
//     if let welcome = welcome {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let kind, etag, nextPageToken, regionCode: String
    let pageInfo: PageInfo
    let items: [Item]
}

// MARK: Welcome convenience initializers and mutators

extension Welcome {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Welcome.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        kind: String? = nil,
        etag: String? = nil,
        nextPageToken: String? = nil,
        regionCode: String? = nil,
        pageInfo: PageInfo? = nil,
        items: [Item]? = nil
    ) -> Welcome {
        return Welcome(
            kind: kind ?? self.kind,
            etag: etag ?? self.etag,
            nextPageToken: nextPageToken ?? self.nextPageToken,
            regionCode: regionCode ?? self.regionCode,
            pageInfo: pageInfo ?? self.pageInfo,
            items: items ?? self.items
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.itemTask(with: url) { item, response, error in
//     if let item = item {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Item
struct Item: Codable {
    let kind, etag: String
    let id: ID
    let snippet: Snippet
}

// MARK: Item convenience initializers and mutators

extension Item {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Item.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        kind: String? = nil,
        etag: String? = nil,
        id: ID? = nil,
        snippet: Snippet? = nil
    ) -> Item {
        return Item(
            kind: kind ?? self.kind,
            etag: etag ?? self.etag,
            id: id ?? self.id,
            snippet: snippet ?? self.snippet
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.iDTask(with: url) { iD, response, error in
//     if let iD = iD {
//       ...
//     }
//   }
//   task.resume()

// MARK: - ID
struct ID: Codable {
    let kind, videoID: String

    enum CodingKeys: String, CodingKey {
        case kind
        case videoID = "videoId"
    }
}

// MARK: ID convenience initializers and mutators

extension ID {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ID.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        kind: String? = nil,
        videoID: String? = nil
    ) -> ID {
        return ID(
            kind: kind ?? self.kind,
            videoID: videoID ?? self.videoID
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.snippetTask(with: url) { snippet, response, error in
//     if let snippet = snippet {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Snippet
struct Snippet: Codable {
    let publishedAt: Date
    let channelID, title, snippetDescription: String
    let thumbnails: Thumbnails
    let channelTitle, liveBroadcastContent: String
    let publishTime: Date

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title
        case snippetDescription = "description"
        case thumbnails, channelTitle, liveBroadcastContent, publishTime
    }
}

// MARK: Snippet convenience initializers and mutators

extension Snippet {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Snippet.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        publishedAt: Date? = nil,
        channelID: String? = nil,
        title: String? = nil,
        snippetDescription: String? = nil,
        thumbnails: Thumbnails? = nil,
        channelTitle: String? = nil,
        liveBroadcastContent: String? = nil,
        publishTime: Date? = nil
    ) -> Snippet {
        return Snippet(
            publishedAt: publishedAt ?? self.publishedAt,
            channelID: channelID ?? self.channelID,
            title: title ?? self.title,
            snippetDescription: snippetDescription ?? self.snippetDescription,
            thumbnails: thumbnails ?? self.thumbnails,
            channelTitle: channelTitle ?? self.channelTitle,
            liveBroadcastContent: liveBroadcastContent ?? self.liveBroadcastContent,
            publishTime: publishTime ?? self.publishTime
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.thumbnailsTask(with: url) { thumbnails, response, error in
//     if let thumbnails = thumbnails {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high: Default

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high
    }
}

// MARK: Thumbnails convenience initializers and mutators

extension Thumbnails {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Thumbnails.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        thumbnailsDefault: Default? = nil,
        medium: Default? = nil,
        high: Default? = nil
    ) -> Thumbnails {
        return Thumbnails(
            thumbnailsDefault: thumbnailsDefault ?? self.thumbnailsDefault,
            medium: medium ?? self.medium,
            high: high ?? self.high
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.defaultTask(with: url) { default, response, error in
//     if let default = default {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Default
struct Default: Codable {
    let url: String
    let width, height: Int
}

// MARK: Default convenience initializers and mutators

extension Default {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Default.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        url: String? = nil,
        width: Int? = nil,
        height: Int? = nil
    ) -> Default {
        return Default(
            url: url ?? self.url,
            width: width ?? self.width,
            height: height ?? self.height
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.pageInfoTask(with: url) { pageInfo, response, error in
//     if let pageInfo = pageInfo {
//       ...
//     }
//   }
//   task.resume()

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int
}

// MARK: PageInfo convenience initializers and mutators

extension PageInfo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PageInfo.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        totalResults: Int? = nil,
        resultsPerPage: Int? = nil
    ) -> PageInfo {
        return PageInfo(
            totalResults: totalResults ?? self.totalResults,
            resultsPerPage: resultsPerPage ?? self.resultsPerPage
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func welcomeTask(with url: URL, completionHandler: @escaping (Welcome?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

