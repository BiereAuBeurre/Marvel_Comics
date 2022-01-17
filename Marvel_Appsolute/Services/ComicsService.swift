//
//  ComicsService.swift
//  Marvel_Appsolute
//
//  Created by Manon Russo on 17/01/2022.
//

import Foundation
import Alamofire
import CoreData

class ComicsService {
    
    private let session: Session
    init(session: Session = .default) {
        self.session = session
    }
    
//    func fetchRecipes(for searchTerms: String, completion: @escaping (Result<RecipesInfo, AFError>) -> Void) {

    func fetchAllComics(completion: @escaping (Result<Comic, AFError>) -> Void) {
    let url = "https://gateway.marvel.com/v1/public/comics?ts=1&apikey=\(APIConfiguration.publicKey)&hash=\(APIConfiguration.hash)"
        session.request(url).validate().responseDecodable(of: Comic.self) { (response) in
            completion(response.result)
        }
    }
    
}
