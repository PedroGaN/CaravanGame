//
//  GameViewController.swift
//  CaravanGame
//
//  Created by user177273 on 11/9/20.
//

import UIKit

class GameViewController: UIViewController, GameViewProtocol {

    var gamePresenterProtocol : GamePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //self.gamePresenterProtocol = GamePresenter(gameViewProtocol: self)
        
    }

}

protocol GameViewProtocol {
    //ADD FUNCTIONS
}
