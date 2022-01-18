//
//  UIImageView.swift
//  Marvel_Appsolute
//
//  Created by Manon Russo on 17/01/2022.
//

import UIKit

extension UIImageView {

    func loadImage(_ urls: String) {
        let urlString = "\(urls)"
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data) else { return }
            DispatchQueue.main.async  { [weak self] in
                self?.image = image
            }
        }
    }
}
