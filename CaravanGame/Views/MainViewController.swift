//
//  MainViewController.swift
//  CaravanGame
//
//  Created by user177273 on 11/9/20.
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {

    var mainPresenterProtocol : MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.mainPresenterProtocol = MainPresenter(mainViewProtocol: self)
        
    }
    
    @IBAction func NewGameAction(_ sender: Any) {
        self.mainPresenterProtocol?.goToGame()
    }

}

protocol MainViewProtocol : class {
    //ADD FUNCTIONS
}
