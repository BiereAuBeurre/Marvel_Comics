//
//  DetailsViewController.swift
//  Marvel_Appsolute
//
//  Created by Manon Russo on 17/01/2022.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    //MARK: - Properties
    private let parentStackView = UIStackView()
    private let synopsis = UITextView()
    private let titleLabel = UILabel()
    private let cover = UIImageView()
    
    private let storageService = StorageService()
    var comic: ResultElement?
    private var isComicFavorite = false
    
    //MARK: -view life cycle methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchFavoriteState()
        setUpFavoriteButton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    //MARK: - OBJC METHODS
    @objc
    func toggleFavorite() {
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

    //MARK: - private methods
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
            print("erreur : \(error.localizedDescription)")
        }
    }
    
    private func removeFromFavorite() {
        guard let comic = comic else { return }
        do {
            try storageService.deleteRecipe(comic)
            isComicFavorite = false
        } catch {
            print("erreur: \(error.localizedDescription)")
        }
    }
}

//MARK: - Setting up View
extension DetailsViewController {
    
    func setUpUI() {
        view.backgroundColor = .systemBackground
        
        // TITLE
        titleLabel.text = comic?.title
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)
        
        // STACKVIEW
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.axis = .vertical
        view.addSubview(parentStackView)
        parentStackView.distribution = .fill
        parentStackView.spacing = 16
        parentStackView.contentMode = .left
        
        // IMAGE COVER
        let imagepath = "\(comic?.thumbnail.path ?? "")"+"/portrait_xlarge."+"\(comic?.thumbnail.thumbnailExtension ?? "")"
        if imagepath == "/portrait_xlarge." {
            cover.image = UIImage(named: "logomarvel")
        } else {
            cover.loadImage(imagepath)
        }
        cover.contentMode = .scaleAspectFit
        parentStackView.addArrangedSubview(cover)

        // DESCRIPTION/SYNOPSIS
        synopsis.textColor = .black
        if comic?.resultDescription != "" {
            synopsis.text = comic?.resultDescription
        } else {
            synopsis.text = "Aucune description disponible pour ce comic 😞"
        }
        synopsis.font = UIFont.preferredFont(forTextStyle: .subheadline)
        parentStackView.addArrangedSubview(synopsis)

        // Constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            parentStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
             view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: parentStackView.bottomAnchor, constant: 16),
        ])
    }
    
}
