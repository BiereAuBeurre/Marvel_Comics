//
//  ViewController.swift
//  Marvel_Appsolute
//
//  Created by Manon Russo on 17/01/2022.
//

import UIKit

class HomeViewController: UIViewController {

    var logo = UIImageView()
    var titleLabel = UILabel()
    var seeComicsButton = UIButton()
    var seeFavoritesButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
    }

    @objc
    func showFavorites() {
        let comicsVC = ComicsViewController()
        comicsVC.dataMode = .favorites
        navigationController?.pushViewController(comicsVC, animated: true)
    }
    
    @objc
    func showComicsVC() {
        let comicsVC = ComicsViewController()
//        navigationController?.isNavigationBarHidden = false
//        comicsVC.dataMode = .api
        
        navigationController?.pushViewController(comicsVC, animated: true)
    }

}

extension HomeViewController {
    
    func setUpUI() {
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logo)
        logo.image = UIImage(named: "logomarvel")
        logo.addShadow()
        
        seeComicsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(seeComicsButton)
        seeComicsButton.setTitle("Tous les comics 📖", for: .normal)
        seeComicsButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        seeComicsButton.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        seeComicsButton.setTitleColor(.white, for: .normal)
        seeComicsButton.addCornerRadius()
        seeComicsButton.addShadow()
        seeComicsButton.addTarget(self, action: #selector(showComicsVC), for: .touchUpInside)
        
        seeFavoritesButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(seeFavoritesButton)
        seeFavoritesButton.setTitle("Les favoris ♥️", for: .normal)
        seeFavoritesButton.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        seeFavoritesButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        seeFavoritesButton.setTitleColor(.white, for: .normal)
        seeFavoritesButton.addCornerRadius()
        seeFavoritesButton.addShadow()
        seeFavoritesButton.addTarget(self, action: #selector(showFavorites), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64),
            logo.heightAnchor.constraint(equalToConstant: 120),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 100),
            
//            titleLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 104),
//            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            seeComicsButton.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 104),
            seeComicsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            seeComicsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            
            seeFavoritesButton.topAnchor.constraint(equalTo: seeComicsButton.bottomAnchor, constant: 32),
            seeFavoritesButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            seeFavoritesButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80)
        ])

    }
}

