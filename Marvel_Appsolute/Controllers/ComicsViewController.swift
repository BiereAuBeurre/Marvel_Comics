//
//  ComicsViewController.swift
//  Marvel_Appsolute
//
//  Created by Manon Russo on 17/01/2022.
//

import Foundation
import UIKit

public enum DataMode {
    case api
    case favorites
    var title: String {
        switch self {
        case .api :
            return "Tous les comics"
        case .favorites :
            return "Mes Favoris"
        }
    }
}

//enum State<Data> {
//    case loading
//    case empty
//    case error
//    case showData(Data)
//}

class ComicsViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    var comics: [Results] = []
    
    
//    var dataMode: DataMode = .api
    var comicsService = ComicsService()
//
//    var viewState: State<[Results]> = .loading {
//        didSet {
////            resetState()
//            switch viewState {
//            case .loading :
////                activityIndicator.startAnimating()
//                print("loading")
//            case .empty :
////                displayEmptyView()
//                print("empty")
//            case .error :
//                print("error")
////                showAlert("Error", "Something went wrong, try again please")
//            case .showData (let comics):
////                print("datas are shown")
//                self.comics = comics
//                print("here the results \(comics)")
//                collectionView.reloadData()
////                collectionView.isHidden = false
//            }
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        fetchComics()
//        setUpUI()


    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.dataMode = .api
        self.setUpUI()
        self.fetchComics()
        print("we're in comicsVC now")
    }
    
//    func refreshWith(comics: [Results]) {
//        viewState = .showData(comics)
//    }
    
    
    func fetchComics() {
//        if dataMode == .api {
        comicsService.fetchAllComics { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comic):
                    self.comics = comic.data.results
                    
//                    self.viewState = .showData(comic.data.results)
                    print("success!: \(comic.data.results)")
//                    print("we're in data mode :\(self.dataMode)")
                    self.collectionView.reloadData()
//                    self.collectionView.isHidden = false

                case .failure(let error):
                    print("error! : \(error.localizedDescription) \n\n\n\n \(error)")
                }
            }
        }
//    } else {
//        print("we're in the FavoritesDataMode for comics VC")
//    }
}
    
}
extension ComicsViewController {
    
    func setUpUI() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.width - 16, height: 60)
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(ComicCell.self, forCellWithReuseIdentifier: ComicCell.identifier)
        collectionView.backgroundColor = .purple
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.isUserInteractionEnabled = true
        view.addSubview(collectionView ?? UICollectionView())

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
    
    
    
}
//MARK: - setting up collection view

extension ComicsViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //appel réseau
        return comics.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // appel réseau
        let comicCell = collectionView.dequeueReusableCell(withReuseIdentifier: ComicCell.identifier, for: indexPath) as! ComicCell
        comicCell.comic = comics[indexPath.row]
        return comicCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = comics[indexPath.row]
    }
}
