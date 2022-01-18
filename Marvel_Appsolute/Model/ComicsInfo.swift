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
//    let dates: [DateElement]
    let thumbnail: Thumbnail
//    let creators: Creators

    enum CodingKeys: String, CodingKey {
        case title
        case resultDescription = "description"
        case /*dates, */thumbnail/*, creators*/
    }
}

// MARK: - Creators
//struct Creators: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [Item]
//    let returned: Int
//}

// MARK: - Item
//struct Item: Codable {
//    let resourceURI: String
//    let name/*, role: */:String
//}

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
extension ResultElement {
    init(from comicEntity: ComicEntity) {
        if let thumbnailData = comicEntity.thumbnail, let image = try? JSONDecoder().decode(Thumbnail.self, from: thumbnailData) {
            self.thumbnail = image
        } else {
            self.thumbnail = Thumbnail(path: "image_not_available", thumbnailExtension: "jpg")

        }
        
//        if let creatorsData = comicEntity.creators, let creatorsinfo = try? JSONDecoder().decode(Creators.self, from: creatorsData) {
//            self.creators = creatorsinfo
//        } else {
//            self.creators = Creators(items: Item.init(name: "not available"))
//        }
        
//        self.thumbnail = comicEntity.thumbnail
        self.resultDescription = comicEntity.synopsis ?? ""
        self.title = comicEntity.title ?? ""
//        self.pageCount = Int(comicEntity.pageCount)
//        self.onSaleDate = comicEntity.onSaleDate ?? Date.now
    }
}

extension ResultElement: Equatable {
    static func == (lhs: ResultElement, rhs: ResultElement) -> Bool {
        return lhs.title == rhs.title
    }
}
//}

//extension ResultElement {
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let comic = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .)
//        title = try comic.decode(String.self, forKey: .title)
//        synopsis = try comic.decode(String.self, forKey: .synopsis)
//        pageCount = try comic.decode(Int.self, forKey: .pageCount)
//        thumbnail = try comic.decode(Thumbnail.self, forKey: .thumbnail)
//        onSaleDate = try comic.decode(Date.self, forKey: .onSaleDate)
//    }
//}


//struct DataClass: Decodable {
////    let data: ComicInfo
//    let results: [Comic]
//}
//
//struct ComicInfo: Decodable {
////    let results: [Comic]
//    let data: DataClass
////    let thumbnail: Thumbnail
//
////    enum CodingKeys: String, CodingKey {
////        case comics = "results"
////    }
//}
//
//struct Comic: Decodable {
//    let title: String
//    let synopsis: String?
//    let pageCount: Int
//    let thumbnail: Thumbnail
//    let onSaleDate: Date
//
//    enum CodingKeys: String, CodingKey {
//        case comic = "results"
//        case title
//        case synopsis = "description"
//        case pageCount
//        case thumbnail
//        case onSaleDate
//    }
//}
//
//
//struct Thumbnail: Decodable {
//    let path: String
//    let thumbnailExtension: String
//
//    enum CodingKeys: String, CodingKey {
//        case path
//        case thumbnailExtension = "extension"
//    }
//}
//

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    init(from comicEntity: ComicEntity) {
//        if let thumbnailData = comicEntity.thumbnail, let image = try? JSONDecoder().decode(Thumbnail.self, from: thumbnailData) {
//            self.thumbnail = image
//        } else {
//            self.thumbnail = Thumbnail(path: "image_not_available", thumbnailExtension: "jpg")
//            
//        }
////        self.thumbnail = comicEntity.thumbnail
//        self.synopsis = comicEntity.synopsis
//        self.title = comicEntity.title ?? ""
//        self.pageCount = Int(comicEntity.pageCount)
//        self.onSaleDate = comicEntity.onSaleDate ?? Date.now
//    }
//}

//struct ComicsInfo: Decodable {
//
//    let comics: [Comic]
//
//    enum CodingKeys: String, CodingKey {
//        case comics = "results"
//    }
//}

//struct Comic: Decodable {
//    let title: String
//    let synopsis: String?
//    let pageCount: Int
//    let thumbnail: Thumbnail
//    let onSaleDate: Date
//
//    struct Thumbnail: Decodable {
//        let path: String
//        let `extension`: String
//    }
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
//        thumbnail = try comic.decode(Thumbnail.self, forKey: .thumbnail)
//        onSaleDate = try comic.decode(Date.self, forKey: .onSaleDate)
//    }
//}

//extension Comic {
//    init(from service: ComicService)
//}

// MARK: - Comic
//struct Comic: Codable {
//    let code: Int
//    let status, copyright, attributionText, attributionHTML: String
//    let data: DataClass
//}

// MARK: - DataClass
//struct DataClass: Codable {
//    let offset, limit, total, count: Int
//    let results: [Results]
//}

// MARK: - Result

//struct Results: Codable {
//    let title, resultDescription: String
////    let dates: [DateElement]
//    let thumbnail: Thumbnail
//    let creators: Creators
//
//
//    enum CodingKeys: String, CodingKey {
//        case title
//        case resultDescription = "description"
//        case/* dates, */thumbnail, creators
//    }
//}

// MARK: - Creators
//struct Creators: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [Item]
//    let returned: Int
//}

// MARK: - Item
//struct Item: Codable {
//    let resourceURI: String
//    let name, role: String
//}


// MARK: - Thumbnail
//struct Thumbnail: Codable {
//    let path: String
//    let thumbnailExtension: String
//
//    enum CodingKeys: String, CodingKey {
//        case path
//        case thumbnailExtension = "extension"
//    }
//}

// MARK: - DateElement
//struct DateElement: Codable {
//    let type: String
//    let date: Date
//}

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

//
//}
//
//extension Results {
//    init(from comicEntity: ComicEntity) {
//        self.title = comicEntity.title ?? ""
////        self.thumbnail = comicEntity.thumbnail ?? nil
////        comicEntity.thumbnail
////        self.synopsis = comicEntity.synopsis ?? ""
////        self.onSaleDate = comicEntity.onSaleDate ?? Date.now
//
//        if let thumbnailData = comicEntity.thumbnail, let thumbnail = try? JSONDecoder().decode(Thumbnail.self, from: thumbnailData) {
//            self.thumbnail = thumbnail
//        } else {
//            self.thumbnail = Thumbnail(path: "", thumbnailExtension: "")
//        }
//}
//    extension Thumbnail {
//        init(from comicEntity: ComicEntity)
//        self.thumbnailExtension = comicEntity.thumbnail
//    }

//}
