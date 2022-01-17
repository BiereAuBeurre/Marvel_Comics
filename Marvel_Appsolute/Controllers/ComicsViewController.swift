//
//  ComicsViewController.swift
//  Marvel_Appsolute
//
//  Created by Manon Russo on 17/01/2022.
//

import Foundation
import UIKit

class ComicsViewController: UIViewController {
    
    var collectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("we're in comicsVC now")    }
}

extension ComicsViewController {
    
    func setUpUI() {
        
        
        NSLayoutConstraint.activate([
        //code
        ])
    }
}
//MARK: - setting up collection view

extension ComicsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //appel réseau
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // appel réseau
        return cell
    }
    
    
}
