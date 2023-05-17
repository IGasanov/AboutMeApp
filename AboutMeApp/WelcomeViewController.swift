//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Гамзат Гасанов on 16.05.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var userName: String?
    

    @IBOutlet weak var welcomeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userName ?? "")!"
    }

    
}
