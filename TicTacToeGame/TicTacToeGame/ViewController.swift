//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by Adam Ding on 10/19/18.
//  Copyright © 2018 Adam Ding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var board = [[String]]()
    var playerNum = 1   //1 for player1, 2 for player2
    var turn = 1    //keeps count of turn number
    var playerSymbol = "X"
    var imageName = "X2image.png"
    //Buttons for the board
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Tic-Tac-Toe-Board-letter.jpg")!)
        let fillerArray = ["", "", ""]
        for _ in 0..<3 {
            board.append(fillerArray)
        }
    }


    @IBAction func place(_ sender: UIButton) {
        
        guard let button = sender as? UIButton else{
            return
        }
        switch button.tag{
        case 1:
            //print("One")
            let checker = placePiece(playersymbol: playerSymbol, x: 0, y: 0)
            if checker {
                 button.setImage(UIImage(named: imageName), for: .normal)
            }
        case 2:
            //print("Two")
            let checker = placePiece(playersymbol: playerSymbol, x: 0, y: 1)
            if checker {
                button.setImage(UIImage(named: imageName), for: .normal)
            }
        case 3:
            //print("Three")
            let checker = placePiece(playersymbol: playerSymbol, x: 0, y: 2)
            if checker {
                button.setImage(UIImage(named: imageName), for: .normal)
            }
        case 4:
            //print("Four")
            let checker = placePiece(playersymbol: playerSymbol, x: 1, y: 0)
            if checker {
                button.setImage(UIImage(named: imageName), for: .normal)
            }
        case 5:
            //print("Five")
            let checker = placePiece(playersymbol: playerSymbol, x: 1, y: 1)
            if checker {
                button.setImage(UIImage(named: imageName), for: .normal)
            }
        case 6:
            //print("Six")
            let checker = placePiece(playersymbol: playerSymbol, x: 1, y: 2)
            if checker {
                button.setImage(UIImage(named: imageName), for: .normal)
            }
        case 7:
            //print("Seven")
            let checker = placePiece(playersymbol: playerSymbol, x: 2, y: 0)
            if checker {
                button.setImage(UIImage(named: imageName), for: .normal)
            }
        case 8:
            //print("Eight")
            let checker = placePiece(playersymbol: playerSymbol, x: 2, y: 1)
            if checker {
                button.setImage(UIImage(named: imageName), for: .normal)
            }
        case 9:
            //print("Nine")
            let checker = placePiece(playersymbol: playerSymbol, x: 2, y: 2)
            if checker {
                button.setImage(UIImage(named: imageName), for: .normal)
            }
        default:
            return
        }
        
        
    }
    
    func positionOcc(x : Int, y : Int) -> Bool{ //checks to see if the position is taken or not
        if (board[x][y] == "X") || (board[x][y] == "O"){
            return true
        }
        return false
    }
    
    func placePiece(playersymbol : String, x : Int, y : Int) -> Bool{
        let check = positionOcc(x: x, y: y)
        if check == true{
            let alert = UIAlertController(title: "Invalid Move", message: "This position is already in use", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            return false
        }
        else{
            board[x][y] = playersymbol  //places piece in board if that space is available
            if playerNum == 1{
                imageName = "Oimage.png"
                playerSymbol = "O"
                playerNum = 2
            }
            else{
                imageName = "X2image.png"
                playerSymbol = "X"
                playerNum = 1
            }
            if turn >= 5{
                let checkWinner = winner(playerSymbol: playersymbol)
                if checkWinner {
                    let alert = UIAlertController(title: "Winner: " + playerSymbol, message: "WINNER WINNER CHICKEN DINNER", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Play again?", style: .default, handler: {(action: UIAlertAction!)in
                        print("User pressed OK")
                        self.resetGame()
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }//checks if a player has won
            if turn == 9{
                let alert = UIAlertController(title: "Draw", message: "feelsbadman", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Play again?", style: .default, handler: {(action: UIAlertAction!)in
                    self.resetGame()
                }))
                self.present(alert, animated: true, completion: nil)
            }//checks to see if players had a draw
            turn += 1
            return true
        }
    }
    
    func winner(playerSymbol : String) -> Bool{
        if (board[0][0] == playerSymbol) && (board[0][1] == playerSymbol) && (board[0][2] == playerSymbol){
            return true
        }
        else if (board[1][0] == playerSymbol) && (board[1][1] == playerSymbol) && (board[1][2] == playerSymbol){
            return true
        }
        else if (board[2][0] == playerSymbol) && (board[2][1] == playerSymbol) && (board[2][2] == playerSymbol){
            return true
        }
        else if (board[0][0] == playerSymbol) && (board[1][0] == playerSymbol) && (board[2][0] == playerSymbol){
            return true
        }
        else if (board[0][1] == playerSymbol) && (board[1][1] == playerSymbol) && (board[2][1] == playerSymbol){
            return true
        }
        else if (board[0][2] == playerSymbol) && (board[1][2] == playerSymbol) && (board[2][2] == playerSymbol){
            return true
        }
        else if (board[0][0] == playerSymbol) && (board[1][1] == playerSymbol) && (board[2][2] == playerSymbol){
            return true
        }
        else if (board[0][2] == playerSymbol) && (board[1][1] == playerSymbol) && (board[2][0] == playerSymbol){
            return true
        }
        else{
            return false;
        }   //checks board for winning condition
        
    }//checks for winner
    
    func resetGame(){
        board.removeAll()   //clears board
        let fillerArray = ["", "", ""]
        for _ in 0..<3{
            board.append(fillerArray)   //refills the board with blanks
        }
        //Sets buttons image to nil
        button1.setImage(nil, for: .normal)
        button2.setImage(nil, for: .normal)
        button3.setImage(nil, for: .normal)
        button4.setImage(nil, for: .normal)
        button5.setImage(nil, for: .normal)
        button6.setImage(nil, for: .normal)
        button7.setImage(nil, for: .normal)
        button8.setImage(nil, for: .normal)
        button9.setImage(nil, for: .normal)
        turn = 1
        playerNum = 1
        playerSymbol = "X"
        imageName = "X2image.png"
    }
    
}

