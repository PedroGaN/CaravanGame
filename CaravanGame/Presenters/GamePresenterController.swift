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
    let cardButtonImageValid : UIImage? = UIImage(named: "moon_01")
    let cardButtonImageTrap : UIImage? = UIImage(named: "moon_02")
    
    var playerValue : Int = 10
    var timerValue : Int = 10
    var cardOne : CardModel?
    var cardTwo : CardModel?
    var gameSetting : GameModel?
    
    init (gameViewProtocol: GameViewProtocol){
        self.gameViewProtocol = gameViewProtocol
        self.view = gameViewProtocol as? GameViewController
    }
    
    //En esta función se crean las cartas que se van a mostrar en pantalla siguiente unas especificaciones concretas en función del escenario aleatoria surgido
    func setCards() {
        let number = Int.random(in: 1...100)
        let validCheck : Bool = Bool.random()
        if number > (self.gameSetting?.lifeUpCard ?? 0) {
            self.cardOne = CardModel(isValid: validCheck, cardType: "lifeUpCard", playerValue: self.playerValue)
            if validCheck {self.cardTwo = CardModel(isValid: false, cardType: "lifeUpCard", playerValue: self.playerValue)}
            else {self.cardTwo = CardModel(isValid: true, cardType: "lifeUpCard", playerValue: self.playerValue)}
        }
        else if number > (self.gameSetting?.lifeDownCard ?? 0) {
            self.cardOne = CardModel(isValid: validCheck, cardType: "lifeDownCard", playerValue: self.playerValue)
            if validCheck {self.cardTwo = CardModel(isValid: false, cardType: "lifeDownCard", playerValue: self.playerValue)}
            else {self.cardTwo = CardModel(isValid: true, cardType: "lifeDownCard", playerValue: self.playerValue)}
        }
        else if number > (self.gameSetting?.betweenTensCard ?? 0) {
            self.cardOne = CardModel(isValid: validCheck, cardType: "betweenTensCard", playerValue: self.playerValue)
            if validCheck {self.cardTwo = CardModel(isValid: false, cardType: "betweenTensCard", playerValue: self.playerValue)}
            else {self.cardTwo = CardModel(isValid: true, cardType: "betweenTensCard", playerValue: self.playerValue)}
        }
        else if number > (self.gameSetting?.betweenFivesCard ?? 0) {
            self.cardOne = CardModel(isValid: validCheck, cardType: "betweenFivesCard", playerValue: self.playerValue)
            if validCheck {self.cardTwo = CardModel(isValid: false, cardType: "betweenFivesCard", playerValue: self.playerValue)}
            else {self.cardTwo = CardModel(isValid: true, cardType: "betweenFivesCard", playerValue: self.playerValue)}
        }
        else {
            self.cardOne = CardModel(isValid: validCheck, cardType: "standardCard", playerValue: self.playerValue)
            if validCheck {self.cardTwo = CardModel(isValid: false, cardType: "standardCard", playerValue: self.playerValue)}
            else {self.cardTwo = CardModel(isValid: true, cardType: "standardCard", playerValue: self.playerValue)}
        }
        
        if self.view?.timer == nil {
            self.view?.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in self.updateTimerValue()}
            self.view?.timer?.tolerance = 0.2
        }
        self.timerValue = self.gameSetting?.timeToChoose ?? 404
        self.setLayoutValues()
        
        /*print(self.cardOne?.value ?? 38)
        print(self.cardTwo?.value ?? 72)
        print(self.gameSetting?.lifeDownCard ?? 100)
        print(number)*/
    }
    
    //Un UIAlertController para pedirle al jugador que elija una dificultad
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
        
        //Le indico al UIAlertController la vista fuente donde se tiene que mostrar [Para evitar problemas en iPad]
        if let popoverController = actionSheetMenu.popoverPresentationController {
            popoverController.sourceView = self.view?.view }
        
        self.view?.present(actionSheetMenu, animated: true, completion: nil)
    }
    
    //Si el jugador se queda sin tiempo se le resta un intento, se restablece el tiempo del contador y se comprueba el estado de la partida
    func timeOut() {
        self.gameSetting?.numberOfTries -= 1
        self.timerValue = self.gameSetting?.timeToChoose ?? 404
        self.checkGameStatus(playerValue: self.playerValue)
    }
    
    //Cuando el jugador elige una carta se comprueban los valores que tendría y el tipo de carta para o bien penalizar al jugador o bien que continue la partida de manera normal
    func chosedCard(chosedCard: Int) {
        
        let tempPlayerValue = self.playerValue
        
        switch chosedCard {
            case 1:
                self.playerValue += self.cardOne?.value ?? 0
                if self.cardOne?.lifeDown ?? false || self.playerValue < 0 || self.playerValue > 21 {
                    self.gameSetting?.numberOfTries -= 1
                    self.playerValue = tempPlayerValue
                } else if self.cardOne?.lifeUp ?? false { self.gameSetting?.numberOfTries += 1 }
                break
            case 2:
                self.playerValue += self.cardTwo?.value ?? 0
                if self.cardTwo?.lifeDown ?? false || self.playerValue < 0 || self.playerValue > 21 {
                    self.gameSetting?.numberOfTries -= 1
                    self.playerValue = tempPlayerValue
                } else if self.cardTwo?.lifeUp ?? false { self.gameSetting?.numberOfTries += 1 }
                break
            default:
                print("ERROR")
                break
        }
        
        self.checkGameStatus(playerValue: self.playerValue)
    }
    
    //Comprobación de si ha surgido alguna EndCondition en la partida
    func checkGameStatus(playerValue: Int) {
        if playerValue == 21 {showEndGameAlert(endMessage: self.endGame(winStatus: true))}
        else if self.gameSetting?.numberOfTries == 0 {
            self.view?.timer?.invalidate()
            showEndGameAlert(endMessage: self.endGame(winStatus: false)) }
        else{self.setCards()}
    }
    
    //Mini función para mostrar qúe mensaje en función de como ha terminado la partida
    func endGame(winStatus: Bool) -> String {
        if winStatus {return self.gameSetting?.winMessage ?? "ERROR"}
        else {return self.gameSetting?.loseMessage ?? "ERROR"}
    }
    
    //Muestra el cuadro de fin de partida usando un UIAlertController
    func showEndGameAlert(endMessage: String) {
        
        let actionSheetMenu = UIAlertController(title: nil, message: endMessage, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Oke", style: .cancel) { action in
            self.returnToMain()
        }
        
        actionSheetMenu.addAction(cancelAction)
        
        if let popoverController = actionSheetMenu.popoverPresentationController {
            popoverController.sourceView = self.view?.view }
        
        self.view?.present(actionSheetMenu, animated: true, completion: nil)
    }
    
    func setLayoutValues() {
        self.view?.cardOneButton.setTitle(String(self.cardOne?.value ?? 404), for: UIControl.State.normal)
        if self.cardOne?.lifeDown ?? false {self.view?.cardOneButton.setBackgroundImage(self.cardButtonImageTrap, for: UIControl.State.normal)}
        else {self.view?.cardOneButton.setBackgroundImage(self.cardButtonImageValid, for: UIControl.State.normal)}
        self.view?.cardTwoButton.setTitle(String(self.cardTwo?.value ?? 404), for: UIControl.State.normal)
        if self.cardTwo?.lifeDown ?? false {self.view?.cardTwoButton.setBackgroundImage(self.cardButtonImageTrap, for: UIControl.State.normal)}
        else {self.view?.cardTwoButton.setBackgroundImage(self.cardButtonImageValid, for: UIControl.State.normal)}
        self.view?.tryCountLabel.text = (String(self.gameSetting?.numberOfTries ?? 404))
        self.view?.playerPointsLabel.text = (String(self.playerValue))
        self.view?.timerCountLabel.text = (String(self.timerValue))
    }
    
    func updateTimerValue() {
        self.timerValue -= 1
        self.view?.timerCountLabel.text = (String(self.timerValue))
        if self.timerValue <= 0 {self.timeOut()}
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
    func endGame(winStatus: Bool) -> String
    func showEndGameAlert(endMessage: String)
    func setLayoutValues()
    func updateTimerValue()

}
