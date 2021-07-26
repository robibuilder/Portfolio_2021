//
//  ViewController.swift
//  Clicker_Demo
//
//  Created by Jacob Robinett on 6/26/20.
//  Copyright © 2020 Jacob Robinett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // #1 IBOUTLETS TO ADD
    
    @IBOutlet weak var background:UIView!
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var increase:UIButton!
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var sliderValue:UILabel!

    // #2 GLOBAL VARIABLES

    var score = 0;
    var mult = 1
    
    // #3 UPDATE SCORE // UPDATES OUR SCORE LABEL WITH GLOBAL VARIABLE SCORE

        func updateScore()
        {
            scoreLabel?.text = String(score)
        }
        
    // #4 INCREASE SCORE BASED ON SLIDER POSITION

        func increaseScore()
        {
            mult = getSliderValue(slider)
            score = score + mult
            updateScore()
            
        // #4-A OPTIONAL SECTION - BACKGROUND COLOR CHANGING
            
            if(score > 99)
            {
                background.backgroundColor = UIColor.green
            }
            if(score > 199)
            {
                background.backgroundColor = UIColor.yellow
            }
            if(score > 299)
            {
                background.backgroundColor = UIColor.systemPink
            }
            if(score > 399)
            {
                background.backgroundColor = UIColor.purple
            }
            if(score > 499)
            {
                background.backgroundColor = UIColor.gray
            }
            if(score > 599)
            {
                background.backgroundColor = UIColor.orange
            }
            if(score > 799)
            {
                background.backgroundColor = UIColor.red
            }
            if(score > 999)
            {
                background.backgroundColor = UIColor.black
            }
        }
    
    // #5 IBACTION - CONNECTS TO SLIDER UI ELEMENT TO OUR CODE
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        mult = currentValue
            
        sliderValue.text = "\(slider.value)"
    }
    
    // #6 IBACTION - CONNECTS BUTTON TO OUR CODE

    @IBAction func button(_ sender: UIButton)
    {
        increaseScore()
    }
    
    // #7 FUNCTION - RETURNS THE CURRENT POSITION OF OUR SLIDER
    
    func getSliderValue(_ sender: UISlider) -> Int
    {
        return Int(sender.value)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // #8  ADD ONE LINE BELOW
            updateScore()
    }
    
    


}

