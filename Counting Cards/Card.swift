//
//  Card.swift
//  Counting Cards
//
//  Created by Andrew Mellen on 10/15/15.
//  Copyright © 2015 Andrew Mellen. All rights reserved.
//

import Foundation

class Card {
    var num = 0, suit = "", value = 0, pngName = ""
    
    //Creates a card and gives it a value and pngName depending on the card
    init(cardNumber: Int, cardSuit: String){
        num = cardNumber
        suit = cardSuit
        if(num >= 2 && num <= 6){
            value = 1
        }
        else if((num >= 10 && num <= 13) || (num == 1)){
            value = -1
        }
        pngName = cardSuit + cardNumber.description + ".png"
    }
    
    //Creates an empty card
    init(){
    }
}