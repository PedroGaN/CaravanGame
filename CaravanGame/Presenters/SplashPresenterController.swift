//
//  SplashPresenterController.swift
//  CaravanGame
//
//  Created by user177273 on 11/9/20.
//

import Foundation
import UIKit

class SplashPresenter: SplashPresenterProtocol {
    
    var splashViewProtocol : SplashViewProtocol
    
    func goToMain() {
        (self.splashViewProtocol as! SplashViewController).performSegue(withIdentifier: "segueToMain", sender: (Any).self)
    }
    
    init (splashViewProtocol: SplashViewProtocol){
        self.splashViewProtocol = splashViewProtocol
    }
    
}

protocol SplashPresenterProtocol {
    func goToMain()
}
