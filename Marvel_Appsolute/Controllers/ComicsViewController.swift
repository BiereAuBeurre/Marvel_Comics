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
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    var comics: [Results] = []
    var comicsService = ComicsService()
        var dataMode: DataMode = .api

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.fetchComicsFromApi()
        print("we're in comicsVC now")
    }
    
    
    private func fetchComicsFromApi() {
        activityIndicator.startAnimating()
        guard dataMode == .api else { return }
        comicsService.fetchAllComics { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comic):
                    self.comics = comic.data.results
                    print("success!: \(comic.data.results)")
                    self.collectionView.reloadData()
                    self.activityIndicator.stopAnimating()

                case .failure(let error):
                    print("error! : \(error.localizedDescription) \n\n\n\n \(error)")
                }
            }
        }
}
    
    private func cellTapped(comic: Results) {
        let detailsVC = DetailsViewController()
        detailsVC.comic = comic
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}
extension ComicsViewController {
    
    func setUpUI() {
        view.backgroundColor = .systemBackground
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: self.view.frame.width - 16, height: 60)
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
        layout.scrollDirection = .vertical
        
        
        
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(ComicCell.self, forCellWithReuseIdentifier: ComicCell.identifier)
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.isUserInteractionEnabled = true
        view.addSubview(collectionView ?? UICollectionView())
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 4
        layout.itemSize = CGSize(width:(self.collectionView.frame.size.width - 20)/2,height: (self.collectionView.frame.size.height)/3)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
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
        cellTapped(comic: selectedCell)
    }
}
