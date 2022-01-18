//
//  ComicsService.swift
//  Marvel_Appsolute
//
//  Created by Manon Russo on 17/01/2022.
//

import Foundation
import Alamofire

final class ComicsService {
    //MARK: - properties
    private let session: Session
    
    //MARK: - methods
    init(session: Session = .default) {
        self.session = session
    }
    
    func fetchAllComics(completion: @escaping (Result<ComicInfo, AFError>) -> Void) {
    let url = "https://gateway.marvel.com/v1/public/comics?ts=1&apikey=\(APIConfiguration.publicKey)&hash=\(APIConfiguration.hash)"
        session.request(url).validate().responseDecodable(of: ComicInfo.self) { (response) in
            completion(response.result)
        }
    }
    
}
