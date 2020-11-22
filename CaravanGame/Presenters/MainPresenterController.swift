//
//  MainPresenterController.swift
//  CaravanGame
//
//  Created by user177273 on 11/9/20.
//

import Foundation
import UIKit

class MainPresenter: MainPresenterProtocol {
    
    var mainViewProtocol : MainViewProtocol
    var view : MainViewController?
    let instructionsMessage : String = "GAME INSTRUCTIONS\nTo win you need to score 21 points\nTo do so you need to chose between two values that are going to be added to your current score\nYou will have a limited amount of time to pick a number\nAlso, you have a limited amount of tries to reach 21 score\nIf the time runs out, or your score goes higher than 21 or lower than 0 you will lose 1 try\nIf you run out of tries you lose"
    
    init (mainViewProtocol: MainViewProtocol){
        self.mainViewProtocol = mainViewProtocol
        self.view = mainViewProtocol as? MainViewController
    }
    
    func goToGame() {
        (self.mainViewProtocol as! MainViewController).performSegue(withIdentifier: "segueToGame", sender: (Any).self)
    }
    
    func showInstructions() {
            
        let actionSheetMenu = UIAlertController(title: nil, message: self.instructionsMessage, preferredStyle: .alert)
            
        let showLayoutInstructions = UIAlertAction(title: "Show Layout Instructions", style: .default) { action in
            self.showLayoutInstructions()
        }
        
        let cancelAction = UIAlertAction(title: "Oke", style: .cancel) { action in
            actionSheetMenu.dismiss(animated: true, completion: nil)
        }
            
        actionSheetMenu.addAction(cancelAction)
        actionSheetMenu.addAction(showLayoutInstructions)
            
        if let popoverController = actionSheetMenu.popoverPresentationController {
            popoverController.sourceView = self.view?.view }
            
        self.view?.present(actionSheetMenu, animated: true, completion: nil)
        
    }
    
    func showLayoutInstructions() {
        self.view?.layoutInstructionsButton.isEnabled = true
        self.view?.layoutInstructionsButton.isHidden = false
    }
    
    func dismissLayoutInstruction() {
        self.view?.layoutInstructionsButton.isEnabled = false
        self.view?.layoutInstructionsButton.isHidden = true
    }
    
}

protocol MainPresenterProtocol{
    func goToGame()
    func showInstructions()
    func showLayoutInstructions()
    func dismissLayoutInstruction()
}
