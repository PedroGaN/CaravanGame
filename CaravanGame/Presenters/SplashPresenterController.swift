//
//  SplashPresenterController.swift
//  CaravanGame
//
//  Created by user177273 on 11/9/20.
//

import Foundation

class SplashPresenter: SplashPresenterProtocol {
    
    var splashViewProtocol : SplashViewProtocol
    
    init (splashViewProtocol: SplashViewProtocol){
        self.splashViewProtocol = splashViewProtocol
    }
    
}

protocol SplashPresenterProtocol {
            
}
