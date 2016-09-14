//
//  Deck.swift
//  Counting Cards
//
//  Created by Andrew Mellen on 10/15/15.
//  Copyright © 2015 Andrew Mellen. All rights reserved.
//

import Foundation

class Deck{
    var deck = [Card]()
    
    //Make a deck of the cards given
    init(cards: [Card]){
        for card in cards{
            deck.append(card)
        }
    }
    
    //Make an empty deck
    init(){
    }

    //Shuffle the Deck
    func shuffleDeck(){
        deck.shuffle()
    }
    
    //Get any card in the deck
    func getCard(index: Int) -> Card{
        return deck[index]
    }
    
    //Draw the top card in the deck
    func drawCard() -> Card{
         return deck[0]
    }
    
    //Remove a card from the deck
    func removeCard(index: Int){
        deck.removeAtIndex(index)
    }
    
    //Add a card to the back of the deck
    func addCard(card: Card){
        deck.append(card)
    }
    
    //Gives the length of the deck
    func length() -> Int{
        return deck.count
    }
}

extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<52
        {
            sortInPlace { (_,_) in arc4random() < arc4random() }
        }
    }
}