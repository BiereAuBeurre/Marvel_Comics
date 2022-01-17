//
//  ComicsInfo.swift
//  Marvel_Appsolute
//
//  Created by Manon Russo on 17/01/2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let comic = try? newJSONDecoder().decode(Comic.self, from: jsonData)

import Foundation

// MARK: - Comic
struct Comic: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [Results]
}

// MARK: - Result
struct Results: Codable {
    let title, resultDescription: String
//    let dates: [DateElement]
    let thumbnail: Thumbnail
    let creators: Creators

    enum CodingKeys: String, CodingKey {
        case title
        case resultDescription = "description"
        case/* dates, */thumbnail, creators
    }
}

// MARK: - Creators
struct Creators: Codable {
    let available: Int
    let collectionURI: String
    let items: [Item]
    let returned: Int
}

// MARK: - Item
struct Item: Codable {
    let resourceURI: String
    let name, role: String
}

// MARK: - DateElement
//struct DateElement: Codable {
//    let type: String
//    let date: Date
//}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}


//import Foundation
//
//struct ComicsInfo: Decodable {
//
//    let comics: [Comic]
//
//    enum CodingKeys: String, CodingKey {
//        case comics = "results"
//    }
//}
//
//struct Comic: Decodable {
//    let title: String
//    let synopsis: String?
//    let pageCount: Int
//    let thumbnail: String
//    let onSaleDate: Date
//
//    enum CodingKeys: String, CodingKey {
//        case comic
//        case title
//        case synopsis = "description"
//        case pageCount
//        case thumbnail
//        case onSaleDate
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let comic = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .comic)
//        title = try comic.decode(String.self, forKey: .title)
//        synopsis = try comic.decode(String.self, forKey: .synopsis)
//        pageCount = try comic.decode(Int.self, forKey: .pageCount)
//        thumbnail = try comic.decode(String.self, forKey: .thumbnail)
//        onSaleDate = try comic.decode(Date.self, forKey: .onSaleDate)
//    }
//
//}
//
//extension Comic {
//    init(from comicEntity: ComicEntity) {
//        self.title = comicEntity.title ?? ""
//        self.thumbnail = comicEntity.thumbnail ?? ""
//        self.synopsis = comicEntity.synopsis ?? ""
//        self.onSaleDate = comicEntity.onSaleDate ?? Date.now
//    }
//
//}
