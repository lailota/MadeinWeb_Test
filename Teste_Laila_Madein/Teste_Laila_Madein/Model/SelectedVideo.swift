
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
struct Welcome2: Codable {
    let kind, etag: String?
    let items: [Item2]?
    let pageInfo: PageInfo2?
}


// MARK: - Item
struct Item2: Codable {
    let kind, etag, id: String?
    let snippet: Snippet2?
    let statistics: Statistics?
}



// MARK: - Snippet
struct Snippet2: Codable {
    let publishedAt: Date?
    let channelID, title, snippetDescription: String?
    let thumbnails: Thumbnails2?
    let channelTitle: String?
    let tags: [String]?
    let categoryID, liveBroadcastContent: String?
    let localized: Localized2?
    let defaultAudioLanguage: String?

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title
        case snippetDescription = "description"
        case thumbnails, channelTitle, tags
        case categoryID = "categoryId"
        case liveBroadcastContent, localized, defaultAudioLanguage
    }
}



// MARK: - Localized
struct Localized2: Codable {
    let title, localizedDescription: String?

    enum CodingKeys: String, CodingKey {
        case title
        case localizedDescription = "description"
    }
}



// MARK: - Thumbnails
struct Thumbnails2: Codable {
    let thumbnailsDefault, medium, high, standard: Default2?
    let maxres: Default2?

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high, standard, maxres
    }
}



// MARK: - Default
struct Default2: Codable {
    let url: String?
    let width, height: Int?
}


// MARK: - Statistics
struct Statistics: Codable {
    let viewCount, likeCount, dislikeCount, favoriteCount: String?
    let commentCount: String?
}


// MARK: - PageInfo
struct PageInfo2: Codable {
    let totalResults, resultsPerPage: Int?
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

    func welcomeTask(with url: URL, completionHandler: @escaping (Welcome2?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

