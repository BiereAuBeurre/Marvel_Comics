//
//  ComicCell.swift
//  Marvel_Appsolute
//
//  Created by Manon Russo on 17/01/2022.
//

import Foundation
import UIKit

class ComicCell: UICollectionViewCell {
    
    //MARK: - Properties
    private var comicNameLabel = UILabel()
    private var imageCover = UIImageView()
    static let identifier = "ComicCell"
    var comic: Results? {
        didSet {
            refreshData()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemPink
        refreshData()
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    // MARK: Methods
    
    /// Adding space between cells.
    override func layoutSubviews() {
        super.layoutSubviews()
        /// Set the values for top, left, bottom and right margins' cell.
        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
    func refreshData() {
        comicNameLabel.text = comic?.title
        imageCover.image = UIImage(named: "logomarvel")
    }
    
    func setUp() {
        comicNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(comicNameLabel)
        
//        imageCover.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(imageCover)
        
        NSLayoutConstraint.activate([
            comicNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            comicNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            comicNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            comicNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
