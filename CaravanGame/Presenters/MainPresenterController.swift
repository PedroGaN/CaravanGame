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
    
    init (mainViewProtocol: MainViewProtocol){
        self.mainViewProtocol = mainViewProtocol
        self.view = mainViewProtocol as? MainViewController
    }
    
    func goToGame() {
        (self.mainViewProtocol as! MainViewController).performSegue(withIdentifier: "segueToGame", sender: (Any).self)
    }
    
    func showInstructions() {
            
        let actionSheetMenu = UIAlertController(title: nil, message: "oke", preferredStyle: .alert)
            
        let showLayoutInstructions = UIAlertAction(title: "Show Layout Instructions", style: .default) { action in
            //self.
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
        
    }
    
    func dismissLayoutInstruction() {
        
    }
    
}

protocol MainPresenterProtocol{
    func goToGame()
    func showInstructions()
    func showLayoutInstructions()
    func dismissLayoutInstruction()
}
