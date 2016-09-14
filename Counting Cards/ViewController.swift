//
//  ViewController.swift
//  Counting Cards
//
//  Created by Andrew Mellen on 10/15/15.
//  Copyright © 2015 Andrew Mellen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Start a game
    var game = Game()
    
    //GUI objects
    @IBOutlet var cardImage1: UIImageView!
    @IBOutlet var cardImage2: UIImageView!
    @IBOutlet var cardImage3: UIImageView!
    @IBOutlet var cardImage4: UIImageView!
    @IBOutlet var x1Image: UIImageView!
    @IBOutlet var x2Image: UIImageView!
    @IBOutlet var x3Image: UIImageView!
    @IBOutlet var bgImage: UIImageView!
    @IBOutlet var inputText: UITextField!
    
    //Run at start
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up images
        bgImage.image = UIImage(named: "table.jpg")
        updateImages()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func enterButton(sender: UIButton) {
        let inCount = Int(inputText.text!)
        if(inCount != game.currentCount){
            game.addStrike()
            updateImages()
            if(game.strikes == 3){
                popUpFailWindow()
            }
            else{
                popUpWrongWindow()
            }
        }
        game.draw4Cards()
        game.countCards()
        updateImages()
        inputText.text = ""
    }

    @IBAction func newGameButton(sender: AnyObject) {
        game.startGame()
        viewDidLoad()
    }
        
    //Updates the pictures
    func updateImages(){
        if(game.strikes == 0){
            x1Image.image = UIImage(named: "xWhite.png")
            x2Image.image = UIImage(named: "xWhite.png")
            x3Image.image = UIImage(named: "xWhite.png")
        }
        else if(game.strikes == 1){
            x1Image.image = UIImage(named: "xRed.png")
            x2Image.image = UIImage(named: "xWhite.png")
            x3Image.image = UIImage(named: "xWhite.png")
        }
        else if(game.strikes == 2){
            x1Image.image = UIImage(named: "xRed.png")
            x2Image.image = UIImage(named: "xRed.png")
            x3Image.image = UIImage(named: "xWhite.png")
        }
        else if(game.strikes == 3){
            x1Image.image = UIImage(named: "xRed.png")
            x2Image.image = UIImage(named: "xRed.png")
            x3Image.image = UIImage(named: "xRed.png")
        }
        
        cardImage1.image = UIImage(named: game.currentCard1.pngName)
        cardImage2.image = UIImage(named: game.currentCard2.pngName)
        cardImage3.image = UIImage(named: game.currentCard3.pngName)
        cardImage4.image = UIImage(named: game.currentCard4.pngName)
    }
    
    func popUpFailWindow(){
        let alertController = UIAlertController(title: "You Lose!", message: "The Count was " + self.game.currentCount.description + ".\n" + "You made it through " + self.game.score.description + " deals.", preferredStyle: .Alert)
        
        let OKAction = UIAlertAction(title: "Start a New Game", style: .Default) { (action) in
            self.game.startGame()
            self.viewDidLoad()
        }
        
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true) {
        }
    }
    
    func popUpWrongWindow(){
        let alertController = UIAlertController(title: "Wrong!", message: "The Current Count is " + self.game.currentCount.description + ".\n" + "You have " + (3 - self.game.strikes).description + " strikes remaining.", preferredStyle: .Alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
        }
        
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true) {
        }
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

