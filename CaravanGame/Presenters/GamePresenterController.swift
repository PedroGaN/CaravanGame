//
//  GamePresenterController.swift
//  CaravanGame
//
//  Created by user177273 on 11/9/20.
//

import Foundation

class GamePresenter: GamePresenterProtocol {
    
    var gameViewProtocol : GameViewProtocol
    
    init (gameViewProtocol: GameViewProtocol){
        self.gameViewProtocol = gameViewProtocol
    }
    
}

protocol GamePresenterProtocol {
            
}
