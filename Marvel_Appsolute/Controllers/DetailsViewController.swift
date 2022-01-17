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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
