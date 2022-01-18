//
//  ComicsInfo.swift
//  Marvel_Appsolute
//
//  Created by Manon Russo on 17/01/2022.

import Foundation

// MARK: - ComicInfo
struct ComicInfo: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let results: [ResultElement]
}

// MARK: - Result
struct ResultElement: Codable {
    let title, resultDescription: String
    let thumbnail: Thumbnail

    enum CodingKeys: String, CodingKey {
        case title
        case resultDescription = "description"
        case thumbnail
    }
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
extension ResultElement {
    init(from comicEntity: ComicEntity) {
        if let thumbnailData = comicEntity.thumbnail, let image = try? JSONDecoder().decode(Thumbnail.self, from: thumbnailData) {
            self.thumbnail = image
        } else {
            self.thumbnail = Thumbnail(path: "image_not_available", thumbnailExtension: "jpg")
        }
        self.resultDescription = comicEntity.synopsis ?? ""
        self.title = comicEntity.title ?? ""
    }
}

extension ResultElement: Equatable {
    static func == (lhs: ResultElement, rhs: ResultElement) -> Bool {
        return lhs.title == rhs.title
    }
}
