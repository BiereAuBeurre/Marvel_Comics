//
//  DetailsViewController.swift
//  Marvel_Appsolute
//
//  Created by Manon Russo on 17/01/2022.
//

import UIKit

class DetailsViewController: UIViewController {

    var comic: Results?
    override func viewDidLoad() {
        super.viewDidLoad()

        print("we're now in detailsVC")
        print("comic from detailsVC display is : \(String(describing: comic))")
    }

}
