//
//  Game.swift
//  Counting Cards
//
//  Created by Andrew Mellen on 10/16/15.
//  Copyright © 2015 Andrew Mellen. All rights reserved.
//

import Foundation

class Game {
    //No data needed
    init(){
        startGame()
    }
    
    //Current count of the deck
    var currentCount = 0
    
    //Current number of strikes
    var strikes = 0
    
    //Is there a game started?
    var gameStarted = false
    
    //Deck objects
    var deck = Deck()
    var discardDeck = Deck()
    
    //Current cards on the table
    var currentCard1 = Card(), currentCard2 = Card(), currentCard3 = Card(), currentCard4 = Card()
    
    //How many times cards were drawn
    var score = 0
    
    func createDeck(){
        var cardsArray = [Card]()
        
        //Create an array with 6 decks, each 52 cards
        for var y = 1; y <= 6; ++y{
            for x in 1...13{
                cardsArray.append(Card(cardNumber: x, cardSuit: "h"))
            }
            for x in 1...13{
                cardsArray.append(Card(cardNumber: x, cardSuit: "s"))
            }
            for x in 1...13{
                cardsArray.append(Card(cardNumber: x, cardSuit: "c"))
            }
            for x in 1...13{
                cardsArray.append(Card(cardNumber: x, cardSuit: "d"))
            }
        }
        
        //Make the discardDeck empty and the new Deck
        discardDeck = Deck()
        deck = Deck(cards: cardsArray)
        
        //Shuffle the deck
        deck.shuffleDeck()
    }
    
    
    func printDeck(inDeck: Deck){
        /*Print the suit, number, and pngName of
        each card in the inputted deck*/
        print("*************************")
        for index in 0...(inDeck.length() - 1){
            print(inDeck.getCard(index).suit)
            print(inDeck.getCard(index).num)
            print(inDeck.getCard(index).pngName)
        }
        print("*************************")
    }
    
    func drawCard() -> Card{
        //Get the top card in the deck
        let card = deck.drawCard()
        //Add the card to the discardDeck
        discardDeck.addCard(card)
        //Remove the card from the deck
        deck.removeCard(0)
        //Return what the card was
        return card
    }
    
    func draw4Cards(){
        //Create a new deck if the current one is empty
        if(deck.length() == 0){
            createDeck()
        }
        //Draw 4 cards
        currentCard1 = drawCard()
        currentCard2 = drawCard()
        currentCard3 = drawCard()
        currentCard4 = drawCard()
        ++score
    }
    
    //Add the value of the current cards to the count
    func countCards(){
        currentCount += currentCard1.value + currentCard2.value + currentCard3.value + currentCard4.value
    }
    
    //Start a new game
    func startGame(){
        //reset strikes
        strikes = 0
        
        //reset score
        score = 0
        
        createDeck()
        draw4Cards()
        countCards()
    }
    
    func addStrike(){
        ++strikes
    }

}