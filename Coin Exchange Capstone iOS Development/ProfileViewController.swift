//
//  ProfileViewController.swift
//  Coin Exchange Capstone iOS Development
//
//  Created by Pawan Sethi on 11/11/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var Stackview: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        makeRoundedAndShadowed(view: Stackview)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func makeRoundedAndShadowed(view: UIView) {
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true

        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        view.layer.shadowOpacity = 0.9
        view.layer.shadowRadius = 5.0
    }

}
