//
//  GamePresenterController.swift
//  CaravanGame
//
//  Created by user177273 on 11/9/20.
//

import Foundation
import UIKit

class GamePresenter: GamePresenterProtocol {
    
    var cardOne : CardModel?
    var cardTwo : CardModel?
    var gameSetting : GameModel?
    var difficultySetting : String?

    func setGameSettings(difficultSettings: String) {
        
    }
    
    func setCards() {
        
    }
    
    func showDifficultyAlert(gameViewController: GameViewController) {
        
        let actionSheetMenu = UIAlertController(title: nil, message: "Choose Difficulty", preferredStyle: .actionSheet)
        
        let veryEasyAction = UIAlertAction(title: "Very Easy", style: .default) { action in
            self.difficultySetting = "veryEasy"
        }
        let easyAction = UIAlertAction(title: "Easy", style: .default) { action in
            self.difficultySetting = "easy"
        }
        let normalAction = UIAlertAction(title: "Normal", style: .default) { action in
            self.difficultySetting = "normal"
        }
        let hardAction = UIAlertAction(title: "Hard", style: .default) { action in
            self.difficultySetting = "hard"
        }
        let veryHardAction = UIAlertAction(title: "Very Hard", style: .default) { action in
            self.difficultySetting = "veryHard"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            gameViewController.dismiss(animated: true, completion: nil)
        }
        
        actionSheetMenu.addAction(veryEasyAction)
        actionSheetMenu.addAction(easyAction)
        actionSheetMenu.addAction(normalAction)
        actionSheetMenu.addAction(hardAction)
        actionSheetMenu.addAction(veryHardAction)
        actionSheetMenu.addAction(cancelAction)
        
        gameViewController.present(actionSheetMenu, animated: true, completion: nil)
    }
    
    func timeOut() {
        
    }
    
    func chosedCard() {
        
    }
    
}

protocol GamePresenterProtocol {
    func setGameSettings(difficultSettings: String)
    func setCards()
    func showDifficultyAlert(gameViewController: GameViewController)
    func timeOut()
    func chosedCard()
}
