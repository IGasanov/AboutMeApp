//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Гамзат Гасанов on 16.05.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    var user = ""

    @IBOutlet weak var welcomeLabel: UILabel!
    
    private let primaryColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
        )
    
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        welcomeLabel.text = "Welcome, \(user)!"
    }

    
}

