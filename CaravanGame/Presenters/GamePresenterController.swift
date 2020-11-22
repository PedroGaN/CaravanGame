//
//  GamePresenterController.swift
//  CaravanGame
//
//  Created by user177273 on 11/9/20.
//

import Foundation
import UIKit

class GamePresenter: GamePresenterProtocol {
    
    var gameViewProtocol : GameViewProtocol
    
    var view : GameViewController?
    
    var playerValue : Int = 10
    var timerValue : Int = 10
    var cardOne : CardModel?
    var cardTwo : CardModel?
    var gameSetting : GameModel?
    
    init (gameViewProtocol: GameViewProtocol){
        self.gameViewProtocol = gameViewProtocol
        self.view = gameViewProtocol as? GameViewController
    }
    
    func setCards() {
        let number = Int.random(in: 1...10)
        let validCheck : Bool = Bool.random()
        if number > (self.gameSetting?.lifeUpCard ?? 0) {
            self.cardOne = CardModel(isValid: validCheck, cardType: "lifeUpCard", playerValue: 0)
            if validCheck {self.cardTwo = CardModel(isValid: false, cardType: "lifeUpCard", playerValue: 0)}
            else {self.cardTwo = CardModel(isValid: true, cardType: "lifeUpCard", playerValue: 0)}
        }
        else if number > (self.gameSetting?.lifeDownCard ?? 0) {
            self.cardOne = CardModel(isValid: validCheck, cardType: "lifeDownCard", playerValue: 0)
            if validCheck {self.cardTwo = CardModel(isValid: false, cardType: "lifeDownCard", playerValue: 0)}
            else {self.cardTwo = CardModel(isValid: true, cardType: "lifeDownCard", playerValue: 0)}
        }
        else if number > (self.gameSetting?.betweenTensCard ?? 0) {
            self.cardOne = CardModel(isValid: validCheck, cardType: "betweenTensCard", playerValue: 0)
            if validCheck {self.cardTwo = CardModel(isValid: false, cardType: "betweenTensCard", playerValue: 0)}
            else {self.cardTwo = CardModel(isValid: true, cardType: "betweenTensCard", playerValue: 0)}
        }
        else if number > (self.gameSetting?.betweenFivesCard ?? 0) {
            self.cardOne = CardModel(isValid: validCheck, cardType: "betweenFivesCard", playerValue: 0)
            if validCheck {self.cardTwo = CardModel(isValid: false, cardType: "betweenFivesCard", playerValue: 0)}
            else {self.cardTwo = CardModel(isValid: true, cardType: "betweenFivesCard", playerValue: 0)}
        }
        else {
            self.cardOne = CardModel(isValid: validCheck, cardType: "standardCard", playerValue: 0)
            if validCheck {self.cardTwo = CardModel(isValid: false, cardType: "standardCard", playerValue: 0)}
            else {self.cardTwo = CardModel(isValid: true, cardType: "standardCard", playerValue: 0)}
        }
        
        self.timerValue = self.gameSetting?.timeToChoose ?? 404
        self.setLayoutValues()
        /*print(self.cardOne?.value ?? 38)
        print(self.cardTwo?.value ?? 72)
        print(number)*/
    }
    
    func showDifficultyAlert() {
        
        let actionSheetMenu = UIAlertController(title: nil, message: "Choose Difficulty", preferredStyle: UIDevice.current.userInterfaceIdiom == .pad ? .alert : .actionSheet)
        
        let veryEasyAction = UIAlertAction(title: "Very Easy", style: .default) { action in
            self.gameSetting = GameModel(difficultSettings: "veryEasy")
            self.setCards()
        }
        let easyAction = UIAlertAction(title: "Easy", style: .default) { action in
            self.gameSetting = GameModel(difficultSettings: "easy")
            self.setCards()
        }
        let normalAction = UIAlertAction(title: "Normal", style: .default) { action in
            self.gameSetting = GameModel(difficultSettings: "normal")
            self.setCards()
        }
        let hardAction = UIAlertAction(title: "Hard", style: .default) { action in
            self.gameSetting = GameModel(difficultSettings: "hard")
            self.setCards()
        }
        let veryHardAction = UIAlertAction(title: "Very Hard", style: .default) { action in
            self.gameSetting = GameModel(difficultSettings: "veryHard")
            self.setCards()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            self.returnToMain()
        }
        
        actionSheetMenu.addAction(veryEasyAction)
        actionSheetMenu.addAction(easyAction)
        actionSheetMenu.addAction(normalAction)
        actionSheetMenu.addAction(hardAction)
        actionSheetMenu.addAction(veryHardAction)
        actionSheetMenu.addAction(cancelAction)
        
        if let popoverController = actionSheetMenu.popoverPresentationController {
            popoverController.sourceView = self.view?.view }
        
        self.view?.present(actionSheetMenu, animated: true, completion: nil)
    }
    
    func timeOut() {
        self.gameSetting?.numberOfTries -= 1
    }
    
    func chosedCard(chosedCard: Int) {
        
        switch chosedCard {
            case 1:
                self.playerValue += self.cardOne?.value ?? 0
                break
            case 2:
                self.playerValue += self.cardTwo?.value ?? 0
                break
            default:
                print("ERROR")
                break
        }
        
        self.checkGameStatus(playerValue: self.playerValue)
    }
    
    func checkGameStatus(playerValue: Int) {
        if playerValue == 21 || self.gameSetting?.numberOfTries == 0 {
            showEndGameAlert(endMessage: self.endGame())
        }else{
            self.setCards()
        }
    }
    
    func endGame() -> String {
        if self.gameSetting?.numberOfTries == 0 {return self.gameSetting?.winMessage ?? "ERROR"}
        else {return self.gameSetting?.loseMessage ?? "ERROR"}
    }
    
    func showEndGameAlert(endMessage: String) {
        
        let actionSheetMenu = UIAlertController(title: nil, message: endMessage, preferredStyle: .alert)
        
        if let popoverController = actionSheetMenu.popoverPresentationController {
            popoverController.sourceView = self.view?.view }
        
        self.view?.present(actionSheetMenu, animated: true, completion: nil)
    }
    
    func setLayoutValues() {
        self.view?.cardOneButton.setTitle(String(self.cardOne?.value ?? 404), for: UIControl.State.normal)
        self.view?.cardTwoButton.setTitle(String(self.cardTwo?.value ?? 404), for: UIControl.State.normal)
        self.view?.tryCountLabel.setValue(String(self.gameSetting?.numberOfTries ?? 404), forKey: "key")
        self.view?.playerPointsLabel.setValue(String(self.playerValue), forKey: "key")
        self.view?.timerCountLabel.setValue(String(self.gameSetting?.timeToChoose ?? 404), forKey: "key")
    }
    
    func returnToMain() {
        (self.gameViewProtocol as! GameViewController).performSegue(withIdentifier: "segueReturnToMain", sender: (Any).self)
    }
    
}

protocol GamePresenterProtocol {
    func setCards()
    func showDifficultyAlert()
    func timeOut()
    func chosedCard(chosedCard: Int)
    func returnToMain()
    func checkGameStatus(playerValue: Int)
    func endGame() -> String
    func showEndGameAlert(endMessage: String)
    func setLayoutValues()

}
