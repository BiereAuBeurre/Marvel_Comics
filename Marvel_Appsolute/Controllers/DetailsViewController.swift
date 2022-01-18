//
//  DetailsViewController.swift
//  Marvel_Appsolute
//
//  Created by Manon Russo on 17/01/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    private var isComicFavorite = false
    var titleLabel = UILabel()
    var storageService = StorageService()
    var comic: ResultElement?//Comic?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchFavoriteState()
        setUpFavoriteButton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        print("we're now in detailsVC")
        print("comic from detailsVC display is : \(String(describing: comic))")
    }
    
    
    //MARK: - FAVORITES SETTINGS
    private func fetchFavoriteState() {
        guard let comic = comic else { return }
        let comics = try? storageService.loadRecipes()
        guard let _ = comics?.first(where: { $0 == comic }) else { isComicFavorite = false; return }
        isComicFavorite = true
    }
    
    private func setUpFavoriteButton() {
        let navBarRightItem = UIBarButtonItem(
            image: UIImage(systemName: isComicFavorite ? "heart.fill" : "heart"),
            style: .plain,
            target: self,
            action: #selector(toggleFavorite))
        navigationItem.rightBarButtonItem = navBarRightItem
    }
    
    private func addToFavorite() {
        guard let comic = comic else { return }
        do {
            try storageService.saveRecipe(comic)
            fetchFavoriteState()
        } catch {
            print("erreur : \(error)")//; showAlert("Can't save recipe to favorite", "Please try again later")
        }
    }
    
    private func removeFromFavorite() {
        guard let comic = comic else { return }
        do {
            try storageService.deleteRecipe(comic)
            isComicFavorite = false
        } catch {
            print("erreur: \(error)")//; showAlert("Something went wrong", "Can't remove recipe from favorites right now. Please ty again later.")
        }
    }
    
    @objc func toggleFavorite() {
        /// Check if the recipe is already marked as favorite, then add it or remove it from our recipe entity (our favorite data base)
        if isComicFavorite {
            // suppression du favori
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart")
            removeFromFavorite()
            isComicFavorite = false
        } else if isComicFavorite == false {
            // ajout du favori
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart.fill")
            addToFavorite()
            isComicFavorite = true
        }
    }
    
    
    func setUpUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.text = comic?.title
        titleLabel.backgroundColor = .orange
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])

    }

}
