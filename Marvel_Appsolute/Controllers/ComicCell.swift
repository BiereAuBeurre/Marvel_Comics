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
    var comic: ResultElement? {
        didSet {
            refreshData()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .lightGray
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
        var newHttps = comic?.thumbnail.path.dropFirst(4)
        newHttps = "https\(newHttps ?? "")"
        print(newHttps!)
        let imagepath = "\(newHttps ?? "")"+"/portrait_xlarge."+"\(comic?.thumbnail.thumbnailExtension ?? "")"

//        let imagepath = "\(comic?.thumbnail.path ?? "")"+"/portrait_xlarge."+"\(comic?.thumbnail.thumbnailExtension ?? "")"
//        print("image path is :\(imagepath)")
        imageCover.loadImage(imagepath)
//    }
    }
    
    func setUp() {
        imageCover.translatesAutoresizingMaskIntoConstraints = false
        imageCover.alpha = 0.2
        contentView.addSubview(imageCover)
        comicNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(comicNameLabel)
        comicNameLabel.adjustsFontSizeToFitWidth = true
        comicNameLabel.numberOfLines = 0
        comicNameLabel.textColor = .black
        comicNameLabel.addShadow()

        
        NSLayoutConstraint.activate([
            comicNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            comicNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            comicNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            comicNameLabel.heightAnchor.constraint(equalToConstant: 60),
            imageCover.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageCover.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageCover.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageCover.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
