//
//  GameViewController.swift
//  CaravanGame
//
//  Created by user177273 on 11/9/20.
//

import UIKit

class GameViewController: UIViewController, GameViewProtocol {

    var gamePresenterProtocol : GamePresenterProtocol?
    
    @IBOutlet weak var cardOneButton: UIButton!
    @IBOutlet weak var cardTwoButton: UIButton!
    @IBOutlet weak var playerPointsLabel: UILabel!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var timerCountLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.gamePresenterProtocol = GamePresenter(gameViewProtocol: self)
        
    }
    
    @IBAction func cardOneButtonAction(_ sender: Any) {
        gamePresenterProtocol?.chosedCard(chosedCard: 1)
    }
    
    @IBAction func cardTwoButtonAction(_ sender: Any) {
        gamePresenterProtocol?.chosedCard(chosedCard: 2)
    }
    
    
    @IBAction func returnToMainAction(_ sender: Any) {
        gamePresenterProtocol?.returnToMain()
    }
    override func viewDidAppear(_ animated: Bool) {
        gamePresenterProtocol?.showDifficultyAlert()
    }

}

protocol GameViewProtocol {
    //ADD FUNCTIONS
}
