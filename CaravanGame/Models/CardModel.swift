//
//  CardModel.swift
//  CaravanGame
//
//  Created by user177273 on 11/13/20.
//

import Foundation

class CardModel {
    
    var value : Int = -50
    var lifeDown : Bool = false
    var lifeUp : Bool = false
    
    init(isValid : Bool, cardType: String, playerValue: Int) {
                
        setValues(isValid: isValid, cardType: cardType, playerValue: playerValue)
    }
    
    //Función para determinar los valores de la carta en función del escenario aleatorio
    func setValues(isValid : Bool, cardType: String, playerValue: Int){
        
        switch cardType{
        
        case "standardCard":
            
            setCardNumericValue(isValid: isValid, playerValue: playerValue, inBetweenNumbers: 15)
            break
          
        case "betweenTensCard":
            
            setCardNumericValue(isValid: isValid, playerValue: playerValue, inBetweenNumbers: 10)
            break
            
        case "betweenFivesCard":
            
            setCardNumericValue(isValid: isValid, playerValue: playerValue, inBetweenNumbers: 5)
            break
            
        case "lifeDownCard":
            
            if !isValid {self.lifeDown = true}
            setCardNumericValue(isValid: isValid, playerValue: playerValue, inBetweenNumbers: 15)
            break
            
        case "lifeUpCard":
            
            if isValid {self.lifeUp = true}
            setCardNumericValue(isValid: isValid, playerValue: playerValue, inBetweenNumbers: 15)
            break
            
        default: break
            
        }
        
    }
    
    //Función para asegurar al menos un valor válido
    func setCardNumericValue(isValid: Bool, playerValue: Int, inBetweenNumbers: Int){
        
        if (isValid){
            while ((playerValue + self.value) > 21 || (playerValue + self.value) < 0){
                self.value = Int.random(in: (-inBetweenNumbers)...inBetweenNumbers)
            }
        }else{
            self.value = Int.random(in: (-inBetweenNumbers)...inBetweenNumbers)
        }
    
    }
    
}
