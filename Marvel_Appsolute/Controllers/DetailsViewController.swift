//
//  DetailsViewController.swift
//  Marvel_Appsolute
//
//  Created by Manon Russo on 17/01/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var parentStackView = UIStackView()
//    var imageStackView = UIStackView()
//    var infoStackView = UIStackView()
    
    
    var synopsis = UITextView()
    var titleLabel = UILabel()
    var cover = UIImageView()
    var storageService = StorageService()
    var comic: ResultElement?
    private var isComicFavorite = false

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
}

//MARK: - Setting up View
extension DetailsViewController {
    func setUpUI() {
        
        view.backgroundColor = .systemBackground
        
        //MARK: - TITLE
        titleLabel.text = comic?.title
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.axis = .vertical
        view.addSubview(parentStackView)
        parentStackView.distribution = .fill
        parentStackView.spacing = 16
        parentStackView.contentMode = .left
        
        //MARK: -IMAGE COVER
        let imagepath = "\(comic?.thumbnail.path ?? "")"+"/portrait_xlarge."+"\(comic?.thumbnail.thumbnailExtension ?? "")"
        if imagepath == "image_not_available" || comic?.thumbnail.path == "" || comic?.thumbnail.thumbnailExtension == "" || imagepath == "/portrait_xlarge." {
            cover.image = UIImage(named: "logomarvel")
        } else {
            print("image path is :\(imagepath)")
            cover.loadImage(imagepath)
        }
        cover.contentMode = .scaleAspectFit
        parentStackView.addArrangedSubview(cover)
        parentStackView.addArrangedSubview(synopsis)


        //MARK: -DESCRIPTION
        synopsis.textColor = .black

        if comic?.resultDescription != "" {
            synopsis.text = comic?.resultDescription
        } else {
            synopsis.text = "no synopsis available for this comic"
        }
        synopsis.font = UIFont.preferredFont(forTextStyle: .headline)
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            
            parentStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
//            parentStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
             view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: parentStackView.bottomAnchor, constant: 16),
        ])
        
    }
    
}
