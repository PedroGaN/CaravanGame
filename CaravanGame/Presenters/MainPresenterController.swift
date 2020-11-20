//
//  MainPresenterController.swift
//  CaravanGame
//
//  Created by user177273 on 11/9/20.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    
    var mainViewProtocol : MainViewProtocol
    
    
    func goToGame() {
        (self.mainViewProtocol as! MainViewController).performSegue(withIdentifier: "segueToGame", sender: (Any).self)
    }
    
    
    
    init (mainViewProtocol: MainViewProtocol){
        self.mainViewProtocol = mainViewProtocol
    }
    
}

protocol MainPresenterProtocol{
    func goToGame()
}
