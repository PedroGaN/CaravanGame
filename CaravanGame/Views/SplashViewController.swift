//
//  ViewController.swift
//  CaravanGame
//
//  Created by user177273 on 11/9/20.
//

import UIKit

class SplashViewController: UIViewController, SplashViewProtocol {

    var splashPresenterProtocol : SplashPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.s
        
        self.splashPresenterProtocol = SplashPresenter(splashViewProtocol: self)
        
    }

}

protocol SplashViewProtocol {
    //ADD FUNCTIONS

}

