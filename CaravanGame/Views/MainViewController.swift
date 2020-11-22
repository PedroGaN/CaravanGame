//
//  MainViewController.swift
//  CaravanGame
//
//  Created by user177273 on 11/9/20.
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {

    var mainPresenterProtocol : MainPresenterProtocol?
    @IBOutlet weak var layoutInstructionsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.mainPresenterProtocol = MainPresenter(mainViewProtocol: self)
        
    }
    
    @IBAction func NewGameAction(_ sender: Any) {
        self.mainPresenterProtocol?.goToGame()
    }

    @IBAction func dismissLayoutInstructionsAction(_ sender: Any) {
        self.mainPresenterProtocol?.dismissLayoutInstruction()
    }
    @IBAction func ShowInstructionsAction(_ sender: Any) {
        self.mainPresenterProtocol?.showInstructions()
    }
}

protocol MainViewProtocol : class {
    //ADD FUNCTIONS
}
