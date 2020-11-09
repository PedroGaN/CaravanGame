//
//  MainPresenterController.swift
//  CaravanGame
//
//  Created by user177273 on 11/9/20.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    
    var mainViewProtocol : MainViewProtocol
    
    init (mainViewProtocol: MainViewProtocol){
        self.mainViewProtocol = mainViewProtocol
    }
    
}

protocol MainPresenterProtocol {
            
}
