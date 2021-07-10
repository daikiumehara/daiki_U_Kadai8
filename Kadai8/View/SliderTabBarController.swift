//
//  SliderTabBarController.swift
//  Kadai8
//
//  Created by daiki umehara on 2021/07/10.
//

import Foundation
import UIKit

class SliderTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVC = SliderViewController.instantiate(SliderPresenter(), #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))
        let secondVC = SliderViewController.instantiate(SliderPresenter(), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        self.viewControllers = [firstVC, secondVC]
    }
}
