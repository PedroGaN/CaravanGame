//
//  GameModel.swift
//  CaravanGame
//
//  Created by user177273 on 11/20/20.
//

import Foundation

class GameModel {
    
    var numberOfTries: Int = 3
    var timeToChoose: Int = 0
    var betweenTensCard: Int = 0
    var betweenFivesCard: Int = 0
    var lifeDownCard: Int = 0
    var lifeUpCard: Int = 0
    let winMessage: String = "CONGRATULATION!\nYou won"
    let loseMessage: String = "YIKES!\nYou lost"
    
    //Se determina los valores de juego en función de la dificultad que haya establecido el jugador
    init(difficultSettings: String) {
    
        switch difficultSettings {
        case "veryEasy":
            self.timeToChoose = 6
            self.betweenTensCard = 80
            self.betweenFivesCard = 90
            self.lifeDownCard = 101
            self.lifeUpCard = 101
            break
        case "easy":
            self.timeToChoose = 5
            self.betweenTensCard = 85
            self.betweenFivesCard = 70
            self.lifeDownCard = 101
            self.lifeUpCard = 101
            break
        case "normal":
            self.timeToChoose = 4
            self.betweenTensCard = 75
            self.betweenFivesCard = 60
            self.lifeDownCard = 90
            self.lifeUpCard = 95
            break
        case "hard":
            self.timeToChoose = 3
            self.betweenTensCard = 67
            self.betweenFivesCard = 50
            self.lifeDownCard = 85
            self.lifeUpCard = 95
            break
        case "veryHard":
            self.timeToChoose = 2
            self.betweenTensCard = 60
            self.betweenFivesCard = 40
            self.lifeDownCard = 80
            self.lifeUpCard = 95
            break
        default:
            print("ERROR")
        }
        
    }
}
