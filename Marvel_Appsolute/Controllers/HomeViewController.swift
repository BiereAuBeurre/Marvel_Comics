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
    func showComicsVC() {
        let comicsVC = ComicsViewController()
//        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(comicsVC, animated: true)
    }

}

extension HomeViewController {
    
    func setUpUI() {
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logo)
        logo.image = UIImage(named: "logomarvel")
        logo.addShadow()
    
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.text = "Vous désirez consulter :"
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.textAlignment = .center
        
        seeComicsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(seeComicsButton)
        seeComicsButton.setTitle("Tous les comics", for: .normal)
        seeComicsButton.titleLabel?.textColor = .blue
        seeComicsButton.backgroundColor = .black
        seeComicsButton.setTitleColor(.white, for: .normal)
        seeComicsButton.addCornerRadius()
        seeComicsButton.addShadow()
        seeComicsButton.addTarget(self, action: #selector(showComicsVC), for: .touchUpInside)
        view.addSubview(seeFavoritesButton)
        
        seeFavoritesButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(seeFavoritesButton)
        seeFavoritesButton.setTitle("Les favoris", for: .normal)
        seeFavoritesButton.backgroundColor = .black
        seeFavoritesButton.setTitleColor(.white, for: .normal)
        seeFavoritesButton.addCornerRadius()
        seeFavoritesButton.addShadow()
        view.addSubview(seeFavoritesButton)
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 80),
            
            titleLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 160),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            seeComicsButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            seeComicsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 88),
            seeComicsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -88),
            
            seeFavoritesButton.topAnchor.constraint(equalTo: seeComicsButton.bottomAnchor, constant: 16),
            seeFavoritesButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 88),
            seeFavoritesButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -88)
        ])

    }
}

