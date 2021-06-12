//
//  ViewController.swift
//  CardGame
//
//  Created by Konrad Dlugosz on 11/06/2021.
//

import UIKit

class ViewController: UIViewController {
    
    //Object decleration
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightIamgeView: UIImageView!
    
    @IBOutlet weak var PlayerScoreLabel: UILabel!
    
    @IBOutlet weak var CPUScoreLabel: UILabel!
    
    @IBOutlet weak var Winner: UILabel!
    
    @IBOutlet weak var DealButton: UIButton!
    
    @IBOutlet weak var RestartButton: UIButton!

    var PlayerScore:Int = 0
    var CPUScore:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func dealTapped(_ sender: Any) {
        //Random card selection
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)

        //Get cards
        leftImageView.image = UIImage(named: "card\(leftNumber)")
        rightIamgeView.image = UIImage(named: "card\(rightNumber)")
         
        
        //Game over ?
        if PlayerScore >= 25 {
            Winner.text = "Player won!"
            DealButton.isEnabled = false
            
        }
        else if CPUScore >= 25 {
            Winner.text = "CPU won!"
            DealButton.isEnabled = false
        }
        else {
            
            //Count score
            if leftNumber > rightNumber {
                PlayerScore += 1
                
                PlayerScoreLabel.text = String(PlayerScore)
            }
            else if leftNumber < rightNumber {
                CPUScore += 1
                
                CPUScoreLabel.text = String(CPUScore)
            }
        }
    }
    
    @IBAction func Restart(_ sender: Any) {

        PlayerScore = 0
        CPUScore = 0
        
        PlayerScoreLabel.text = String(0)
        CPUScoreLabel.text = String(0)
        
        leftImageView.image = UIImage(named: "back")
        rightIamgeView.image = UIImage(named: "back")
        
        DealButton.isEnabled = true
        
    }
    
}

