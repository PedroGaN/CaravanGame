//
//  GameModel.swift
//  CaravanGame
//
//  Created by user177273 on 11/20/20.
//

import Foundation

class GameModel {
    
    var timeToChoose: Int
    var betweenTensCard: Float
    var betweenFivesCard: Float
    var lifeDownCard: Float
    var lifeUpCard: Float
    
    init(difficultSettings: String) {
    
        switch difficultSettings {
        case "veryEasy":
            self.timeToChoose = 5
            self.betweenTensCard = 80
            self.betweenFivesCard = 90
            self.lifeDownCard = 101
            self.lifeUpCard = 101
        case "easy":
            self.timeToChoose = 4
            self.betweenTensCard = 85
            self.betweenFivesCard = 70
            self.lifeDownCard = 101
            self.lifeUpCard = 101
        case "normal":
            self.timeToChoose = 3
            self.betweenTensCard = 75
            self.betweenFivesCard = 60
            self.lifeDownCard = 90
            self.lifeUpCard = 95
        case "hard":
            self.timeToChoose = 2
            self.betweenTensCard = 67.5
            self.betweenFivesCard = 50
            self.lifeDownCard = 85
            self.lifeUpCard = 95
        case "veryHard":
            self.timeToChoose = 5
            self.betweenTensCard = 60
            self.betweenFivesCard = 40
            self.lifeDownCard = 80
            self.lifeUpCard = 95
        default:
            print("ERROR")
        }
        
    }
}