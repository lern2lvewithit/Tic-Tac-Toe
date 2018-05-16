//
//  ViewController.swift
//  TicTacToe
//
//  Created by Steven Lerner on 5/14/18.
//  Copyright © 2018 Steven Lerner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    
    
    // 1 is noughts, 2 is crosses
    
    var activeGame = true
    
    var activePlayer = 1
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // 0 - empty, 1 - naughts, 2 - crosses
    
    let winningCombos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[2,4,6]]
    
    func winnerLabelAndPlayAgainButton() {
        
        winnerLabel.isHidden = false
        playAgainButton.isHidden = false
        
        UIView.animate(withDuration: 1, animations: {
            
            self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
            self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
            
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
   
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
        
    }

    @IBAction func buttonTapped(_ sender: Any) {
        
        let activePosition = (sender as AnyObject).tag - 1
        
        if gameState[activePosition] == 0 && activeGame{
            
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1 {
                
                (sender as AnyObject).setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
                
            } else {
                
                (sender as AnyObject).setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
                
            }
            
            for combos in winningCombos {
                
                if gameState[combos[0]] != 0 && gameState[combos[0]] == gameState[combos[1]] && gameState[combos[1]] == gameState[combos[2]] {
                    
                    // We have a winnder!
                    
                    activeGame = false
                    
                    /*
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    */
                    
                    if (gameState[combos[0]]) == 1 {
                        
                        winnerLabel.text = "Noughts is the winner!"
                        
                    } else {
                        
                        winnerLabel.text = "Crosses is the winner!"
                        
                    }
                    /*
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                        
                    })
                    */
                    
                    winnerLabelAndPlayAgainButton()
                    
                }
                
            }
            
        }
        
        // If game is a draw
        if !gameState.contains(0) && activeGame {
            
            winnerLabel.text = "Draw!"
            
           /*
            winnerLabel.isHidden = false
            playAgainButton.isHidden = false
            
            UIView.animate(withDuration: 1, animations: {
                
                self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                
            })
            */
            
            winnerLabelAndPlayAgainButton()
            
        }
        
    }
    
    @IBAction func playAgainTapped(_ sender: Any) {
        
        for i in 1..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
                
            }
            
        }
        
        
        activeGame = true
        
        activePlayer = 1
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
    }
    
    
}

